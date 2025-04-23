{
  description = "Modular NixOS config with stable + unstable and multi-host setup";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, flake-utils, ... }:
    let
      system = "x86_64-linux";

      nixosSystem = nixpkgs-stable.lib.nixosSystem;

      pkgsStable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

      pkgsUnstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      sharedModules = [
        ./modules/common-packages.nix
        ./modules/system.nix
      ];
    in {
      nixosConfigurations = {
        argos = nixosSystem {
          inherit system;
          modules = sharedModules ++ [ ./hosts/argos/flake.nix ];
          specialArgs = {
            inherit pkgsStable pkgsUnstable;
          };
        };
      };
    };
}

