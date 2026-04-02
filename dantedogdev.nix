{ pkgs, ... }:

{
	imports = [
		./modules/desktop.nix
		./modules/shell.nix
		./modules/coding.nix
		./modules/gaming.nix
	];

	home.username = "dantedogdev";
	home.homeDirectory = "/home/dantedogdev";
	home.stateVersion = "25.11";

	home.sessionVariables = {
		NIXOS_OZONE_WL = "1";
		WLR_NO_HARDWARE_CURSORS = "1";
		LIBVA_DRIVER_NAME = "nvidia";
		XDG_SESSION_TYPE = "wayland";
		GBM_BACKEND = "nvidia-drm";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
	};

	home.packages = with pkgs; [
		vesktop
	];
}

