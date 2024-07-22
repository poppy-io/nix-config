{
  description = "poppy io's signature home-style flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    NUR.url = "github:nix-community/NUR";

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
    home-manager,
    aagl,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixpkgs.config.allowUnfree = true;

      poppy-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./system/system.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.poppy = import ./poppy/home.nix;
          }

          {
            imports = [aagl.nixosModules.default];
            nix.settings = aagl.nixConfig;
            programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
            programs.honkers-launcher.enable = true;
            programs.sleepy-launcher.enable = true;
          }
        ];
      };
    };
  };
}
