{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "material-nf";

        settings = {
          theme = {
            theme = "gruvbox-light";
            # TODO: manual stylix integration
            #overrides = {
            #  idle_bg = config.lib.stylix.colors.base00;
            #  idle_fg =
            #  good_bg =
            #  good_fg =
            #  warning_bg =
            #  warning_fg =
            #  critical_bg =
            #  info_bg =
            #  info_fg =
            #  alternating_tint_bg =
            #  alternating_tint_fg =
            #  separator_bg =
            #  separator_fg =
            #  separator =
            #  end_separator =
            #};
          };
        };

        blocks = [
          {
            block = "music";
            format = " $icon {$combo.str(max_w:50) $play $next |}";
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
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
      };
    };
  };
}
