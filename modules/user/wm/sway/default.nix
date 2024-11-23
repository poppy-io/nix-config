{pkgs, ...}: {
  imports = [
    ./keybinds.nix
  ];

  # tiling window manager. replaced with swayfx under the hood (probably)
  wayland.windowManager.sway.config = {
    package = pkgs.swayfx;
    enable = true;
    systemd.enable = true;
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
        {command = "exec systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service";}
        {command = "vesktop";}
      ];
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

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    clipman
    swayfx
    wdisplays # GUI display manager for wlroots
    grim # flameshot requirement on wayland ?
  ];
}
