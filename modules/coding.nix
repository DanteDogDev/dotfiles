{ config, pkgs, ... }:

let
dotfiles = "${config.home.homeDirectory}/dotfiles/config";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
	xdg.configFile = {
		nvim = {
			source = create_symlink "${dotfiles}/nvim";
			recursive = true;
		};
		lazygit = {
			source = create_symlink "${dotfiles}/lazygit";
			recursive = true;
		};
		fastfetch = {
			source = create_symlink "${dotfiles}/fastfetch";
			recursive = true;
		};
	};

	home.packages = with pkgs; [
		neovim
		lua5_4
		lua54Packages.luarocks_bootstrap
		fd
		ripgrep
		fzf
		tree-sitter
		p7zip
		nodejs_25

		#CLI
		lazygit
		github-cli
		gemini-cli

		#LSP
		emmylua-ls
		lua-language-server
		nixd
		prettier

		#Python
		(python3.withPackages (ps: with ps; [ 
			 pandas 
		]))
	];
}
