{pkgs, ...}: {
  imports = [
    ./keybinds.nix
    ./outputs.nix
    ./inputs.nix
  ];

  # tiling window manager. replaced with swayfx under the hood (probably)
  programs.wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [{command = "vesktop";}];
      window.titlebar = false;

      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];
    };
  };

  # notification system for sway
  services.mako = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    clipman
  ];
}
