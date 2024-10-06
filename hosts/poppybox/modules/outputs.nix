{...}: {
  wayland.windowManager.sway.config.output = {
    DP-1 = {
      # primary monitor
      mode = "2560x1440@164.987Hz";
      pos = "1920 0";
    };
    DP-2 = {
      # secondary monitor
      pos = "0 0";
    };
    HDMI-A-1 = {
      # TV
      disable = "";
    };
  };
}
