{
  pkgs,
  spicetify-nix,
  ...
}: {
  imports = [
    spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
    ];
    theme = spicePkgs.themes.text;
  };
}
