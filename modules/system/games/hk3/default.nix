{
  lib,
  inputs,
  ...
}: let
  customIcon = builtins.fetchurl (lib.importJSON ./icon.json);
  aaglPkgs = inputs.aagl.packages.x86_64-linux;
in {
  programs.honkers-launcher = {
    enable = true;
    package = aaglPkgs.honkers-launcher.override (old: {
      unwrapped = old.unwrapped.override {
        inherit customIcon;
      };
    });
  };
}
