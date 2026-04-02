{
	description = "Dante's NixOS config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs"; # makes hm follow system packages
		};
	};

	outputs = { nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations.tortilla = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit system; };
			modules = [ 
				./configuration.nix 
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.dantedogdev = import ./dantedogdev.nix;
						backupFileExtension = "backup";
						extraSpecialArgs = { };
					};
				}
			];
		};
	};
}

