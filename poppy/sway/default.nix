{pkgs}: {
  imports = [
    ./keybinds.nix
    ./outputs.nix
    ./inputs.nix
  ];

  # tiling window manager. replaced with swayfx under the hood (probably)
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [{command = "vesktop";}];
      window.titlebar = false;
    };
  };

  # notification system for sway
  services.mako = {
    enable = true;
  };

  home.packages = with pkgs; [
    clipman
  ];
}
