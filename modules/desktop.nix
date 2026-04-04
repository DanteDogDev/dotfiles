{ config, pkgs, ... }:

let
dotfiles = "${config.home.homeDirectory}/dotfiles/config";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
wallpaper = "${config.home.homeDirectory}/dotfiles/wallpapers/fox3.png";
in {

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	dconf.settings = {
		"org/gnome/shell" = {
			disable-user-extensions = false;
			enabled-extensions = [
				"blur-my-shell@aunetx"
					"burn-my-windows@schneegans.github.com"
			];
		};

		# Blur My Shell settings
		"org/gnome/shell/extensions/blur-my-shell" = {
			blur-applications = false;
			blur-overview = true;
			brightness = 0.6;
		};

		# Colorscheme
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			enable-hot-corners = false;
			gtk-application-prefer-dark-theme = true;
		};

		# Wallpaper
		"org/gnome/desktop/background" = {
			picture-uri = "file://${wallpaper}";
			picture-uri-dark = "file://${wallpaper}";
		};

		# Lock screen
		"org/gnome/desktop/screensaver" = {
			picture-uri = "file://${wallpaper}";
		};
	};

	# Home packages
	home.packages = with pkgs; [
		gnome-shell-extensions
		gnomeExtensions.blur-my-shell
		gnomeExtensions.burn-my-windows
		gnome-tweaks

		# Terminal & utilities
		wezterm

		# Fonts
		monocraft
		nerd-fonts.jetbrains-mono
	];

	# Wezterm configuration
	xdg.configFile = {
		wezterm = { source = create_symlink "${dotfiles}/wezterm"; recursive = true; };
	};

}
