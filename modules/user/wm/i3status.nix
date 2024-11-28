{config, ...}: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "material-nf";

        settings = {
          theme = let
            stylix_theme = config.lib.stylix.colors;
          in {
            theme = "modern";
            overrides = {
              idle_bg = "#" + stylix_theme.base00;
              idle_fg = "#" + stylix_theme.base05;
              good_bg = "#" + stylix_theme.base0B;
              good_fg = "#" + stylix_theme.base00;
              warning_bg = "#" + stylix_theme.base09;
              warning_fg = "#" + stylix_theme.base00;
              critical_bg = "#" + stylix_theme.base08;
              critical_fg = "#" + stylix_theme.base00;
              info_bg = "#" + stylix_theme.base0D;
              info_fg = "#" + stylix_theme.base00;
              alternating_tint_bg = "#111111";
              separator_bg = "auto";
              separator_fg = "auto";
            };
          };
        };

        blocks = [
          {
            block = "music";
            format = "$icon {$combo.str(max_w:100) $play $next |}";
          }

          {
            block = "cpu";
          }

          {
            block = "amd_gpu";
            format = " $icon $utilization ";
            format_alt = " $icon MEM: $vram_used_percents ($vram_used/$vram_total) ";
            interval = 1;
          }

          {
            block = "memory";
            format = "$icon $mem_total_used_percents.eng(w:2) ";
            format_alt = "$icon_swap $swap_used_percents.eng(w:2) ";
          }

          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            interval = 20;
            warning = 20.0;
            alert = 10.0;
            format = "$icon $available.eng(w:2) ";
          }

          {
            block = "time";
            interval = 60;
            format = "$timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
      };
    };
  };
}
