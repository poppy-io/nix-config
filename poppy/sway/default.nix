{pkgs, ...}: {
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

  home.packages = with pkgs; [
    clipman
  ];

  # information for swaybar
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "material-nf";
        theme = "ctp-frappe";
        blocks = [
          {
            block = "time";
            interval = 60;
            format = "%a %d/%m %k:%M %p";
          }
          {
            block = "cpu";
          }
          {
            block = "memory";
            format = " $icon $mem_total_used_percents.eng(w:2) ";
            format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            interval = 20;
            warning = 20.0;
            alert = 10.0;
            format = " $icon root: $available.eng(w:2) ";
          }
        ];
      };
    };
  };
}
