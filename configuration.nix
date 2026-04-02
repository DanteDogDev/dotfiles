{ config, lib, pkgs, system, ... }:

{
	imports = [ # Hardware scan results
		./hardware-configuration.nix
	];

##################################################
# Boot
##################################################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ # NVIDIA DRM for Wayland
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

# iGPU module needed for hybrid graphics laptops
boot.initrd.kernelModules = [ "amdgpu" ];

##################################################
# NVIDIA stuff
##################################################

	services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = true;
		open = true; # Use open kernel modules
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

##################################################
# ASUS
##################################################

	systemd.services.supergfxd.path = [ pkgs.pciutils ];

	services.supergfxd = {
		enable = true;
		settings = {
			no_logind = false;
			logout_timeout_s = 10;
			hotplug_type = "Asus";
		};
	};

	services.asusd.enable = true;
	services.upower.enable = true;

##################################################
# Networking
##################################################

	networking.hostName = "tortilla";

	networking.networkmanager.enable = true;
	networking.wireless.enable = true;

##################################################
# Time
##################################################

	time.timeZone = "Europe/Madrid";

##################################################
# Login manager
##################################################

	services.greetd = {
		enable = true;
		settings.default_session = {
			command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd gnome-session --time --remember --remember-user-session";
			user = "greeter";
		};
	};

  # keep user session information
  systemd.tmpfiles.rules = [
    "d /var/cache/tuigreet 0755 greeter greeter - -"
  ];

##################################################
# GNOME
##################################################

	services.gnome.core-utilities.enable = true;
	
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    epiphany
    gnome-user-docs
    yelp
    gnome-font-viewer
    gnome-maps
    gnome-console
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-weather
    simple-scan
    seahorse
  ]);
	
	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.mutter ];
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer']
          '';
    };
	};

##################################################
# Input
##################################################

	services.libinput.enable = true;

##################################################
# Users
##################################################

	users.users.dantedogdev = {
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [ "wheel" "video" ];
		packages = with pkgs; [
			tree
		];
	};

##################################################
# Programs
##################################################

	programs.firefox.enable = true;
	programs.zsh.enable = true;

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};

##################################################
# System packages
##################################################

	environment.systemPackages = with pkgs; [
		vim
		wget
		fastfetch
	];

##################################################
# Services
##################################################

	services.openssh.enable = true;

	# Weekly flake update + rebuild
	systemd.services.flake-update = {
		description = "Update flake inputs and rebuild NixOS";
		serviceConfig = {
			Type = "oneshot";
			WorkingDirectory = "/home/dantedogdev/dotfiles";
			Nice = 19;
			IOSchedulingClass = "idle";
			ExecStart = "${pkgs.writeShellScript "flake-update" ''
				set -e
				${pkgs.nix}/bin/nix flake update --flake /home/dantedogdev/dotfiles
				${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake /home/dantedogdev/dotfiles#tortilla
			''}";
		};
		unitConfig.ConditionACPower = true;
	};

	systemd.timers.flake-update = {
		description = "Weekly flake update";
		wantedBy = [ "timers.target" ];
		timerConfig = {
			OnCalendar = "weekly";
			Persistent = true;
			RandomizedDelaySec = "2h";
		};
		unitConfig.ConditionPathExists = "!/run/user/1000";
	};

##################################################
# Nix package manager config
##################################################

	nixpkgs.config.allowUnfree = true;
	nix.settings = {
		experimental-features = [
			"nix-command"
			"flakes"
		];
	};

##################################################
# System version (DO NOT change even if you update)
##################################################

	system.stateVersion = "25.11";
}
