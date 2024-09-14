{
  description = "poppy io's signature home-style flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    NUR.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    lix-module,
    home-manager,
    aagl,
    ...
  } @ inputs: {
    nixosConfigurations = {
      poppy-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          lix-module.nixosModules.default

          ./configuration.nix
          ./system

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.backupFileExtension = "backup";

            home-manager.users.poppy = import ./poppy;
          }
        ];
      };
    };
  };
}
