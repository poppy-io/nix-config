{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./outputs.nix
    ./inputs.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [{command = "discord";}];
      window.titlebar = false;
    };
  };
}
