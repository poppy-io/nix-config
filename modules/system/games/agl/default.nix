{
  lib,
  inputs,
  ...
}: let
  customIcon = builtins.fetchurl (lib.importJSON ./icon.json);
  aaglPkgs = inputs.aagl.packages.x86_64-linux;
in {
  imports = [inputs.aagl.nixosModules.default];

  programs.anime-game-launcher = {
    enable = true;
    package = aaglPkgs.an-anime-game-launcher.override (old: {
      unwrapped = old.unwrapped.override {
        inherit customIcon;
      };
    });
  };
}