{
  description = "poppy io's signature home-style flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    NUR.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix";

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = {
      "poppybox" = nixpkgs.lib.nixosSystem {
        modules = [
          {nixpkgs.hostPlatform = "x86_64-linux";}

          inputs.lix-module.nixosModules.default
          inputs.aagl.nixosModules.default
          inputs.lanzaboote.nixosModules.lanzaboote
          inputs.spicetify-nix.nixosModules.default

          {
            # should move this to a package by package override at some point
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [(import inputs.emacs-overlay)];

            nix.settings = {
              experimental-features = ["nix-command" "flakes"];
            };
          }

          ./hosts/defaults
          ./hosts/poppybox

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.poppy = import ./hosts/poppybox/users/poppy;
          }

          (import ./overlays)
        ];

        specialArgs = {inherit inputs;};
      };

      "poppypad-A485" = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          {nixpkgs.hostPlatform = "x86_64-linux";}

          inputs.lix-module.nixosModules.default
          inputs.spicetify-nix.nixosModules.default

          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [(import inputs.emacs-overlay)];

            nix.settings = {
              experimental-features = ["nix-command" "flakes"];
            };
          }

          ./hosts/defaults
          ./hosts/poppypad-A485

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users = import ./hosts/poppypad-A485/users/poppy;
          }

          (import ./overlays)
        ];

        specialArgs = {inherit inputs;};
      };
    };
  };
}
