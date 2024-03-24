{
	description = "Hyprcat flake!";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-23.11";
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};
	
	outputs = { self, nixpkgs, home-manager, ... }:
               let 
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
               in {
		nixosConfigurations = {
			hyprcat = lib.nixosSystem { 
				inherit system;
				modules = [ ./system/configuration.nix ];
			};
		};	
		homeConfigurations = {
			fadedead = home-manager.lib.homeManagerConfiguration { 
				inherit pkgs;
				modules = [ ./user/home.nix ];
			};
                };
	};
}
