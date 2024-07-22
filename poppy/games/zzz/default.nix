{ config, pkgs, lib, inputs, ... }:
let
  customIcon = builtins.fetchurl (lib.importJSON ./icon.json);
  aaglPkgs = inputs.aagl.packages.x86_64-linux;
in
{
  programs.sleepy-launcher = {
    enable = true;
    package = aaglPkgs.sleepy-launcher.override (old: {
      unwrapped = old.unwrapped.override {
        inherit customIcon;
      };
    });   
  }

  home.packages = with pkgs; [
    (aliasToPackage {
        zzz = "${config.programs.sleepy-launcher.package}/bin/sleepy-launcher --run-game";
    })
  ];
}