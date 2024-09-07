{
  config,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway.config.keybindings = let
    modifier = config.wayland.windowManager.sway.config.modifier;
    grimshot = pkgs.sway-contrib.grimshot;
    xdg-user-dir = "~/pictures";
  in
    lib.mkOptionDefault {
      ## Screenshot
      "Print" = "exec ${grimshot} --notify save screen ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # All visible outputs
      "Shift+Print" = "exec ${grimshot} --notify save area ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Manually select a region
      "Alt+Print" = "exec ${grimshot} --notify save active ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Currently active window
      "Shift+Alt+Print" = "exec ${grimshot} --notify save window ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Manually select a window
      "Ctrl+Print" = "exec ${grimshot} --notify copy screen";
      "Ctrl+Shift+Print" = "exec ${grimshot} --notify copy area";
      "Ctrl+Alt+Print" = "exec ${grimshot} --notify copy active";
      "Ctrl+Shift+Alt+Print" = "exec ${grimshot} --notify copy window";
      ## Screen recording
      #"${modifier}+Print" = "exec wayrecorder --notify screen";
      #"${modifier}+Shift+Print" = "exec wayrecorder --notify --input area";
      #"${modifier}+Alt+Print" = "exec wayrecorder --notify --input active";
      #"${modifier}+Shift+Alt+Print" = "exec wayrecorder --notify --input window";
      #"${modifier}+Ctrl+Print" = "exec wayrecorder --notify --clipboard --input screen";
      #"${modifier}+Ctrl+Shift+Print" = "exec wayrecorder --notify --clipboard --input area";
      #"${modifier}+Ctrl+Alt+Print" = "exec wayrecorder --notify --clipboard --input active";
      #"${modifier}+Ctrl+Shift+Alt+Print" = "exec wayrecorder --notify --clipboard --input window";
    };
}
