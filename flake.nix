{
  description = "poppy io's signature home-style flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
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

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    lix-module,
    home-manager,
    aagl,
    lanzaboote,
    ...
  }: {
    nixosConfigurations = {
      "poppybox" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          lix-module.nixosModules.default
          aagl.nixosModules.default
          lanzaboote.nixosModules.lanzaboote

          {
            # should move this to a package by package override at some point
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [(import self.inputs.emacs-overlay)];

            nix.settings = {
              experimental-features = ["nix-command" "flakes"];
            };
          }

          ./hosts/defaults
          ./hosts/poppybox

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.poppy = import ./hosts/poppybox/users/poppy;
          }
        ];

        specialArgs = {inherit inputs;};
      };

      "poppypad-A485" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          lix-module.nixosModules.default

          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [(import self.inputs.emacs-overlay)];

            nix.settings = {
              experimental-features = ["nix-command" "flakes"];
            };
          }

          ./hosts/defaults
          ./hosts/poppypad-A485

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users = import ./hosts/poppypad-A485/users/poppy;
          }
        ];

        specialArgs = {inherit inputs;};
      };
    };
  };
}
