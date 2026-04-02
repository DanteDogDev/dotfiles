{ config, pkgs, ... }:

let
	dotfiles = "${config.home.homeDirectory}/dotfiles/config";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
	xdg.configFile.nvim = {
		source = create_symlink "${dotfiles}/nvim";
		recursive = true;
	};

	home.packages = with pkgs; [
		neovim
		lua
		lua55Packages.luarocks_bootstrap
		lazygit
		fd
		ripgrep
		fzf
		tree-sitter
    github-cli

    #LSP
    emmylua-ls
    nixd
    gemini-cli
	];
}
