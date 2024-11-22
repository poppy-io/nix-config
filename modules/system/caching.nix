{
  nix.settings = {
    trusted-users = ["poppy"];

    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://ezkea.cachix.org"
      "https://prismlauncher.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
    ];
  };
}
