{ pkgs, ... }:

{
	home.packages = with pkgs; [
		protonup-qt
		mangohud
		gamescope
		heroic
		ckan
		prismlauncher
	];
}
