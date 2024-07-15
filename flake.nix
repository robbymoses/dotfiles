{
  description = "NixOS Flake Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
	  inherit system specialArgs;
	  modules = [
	    ./hosts/desktop/configuration.nix
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.backupFileExtension = "hm-bak";
	      home-manager.users.rmoses = import ./home.nix;
	    }
	  ];
	};
      };
      homeConfigurations = {
        rmoses = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [
	    ./home.nix
	  ];
	};
      };
    };
}
