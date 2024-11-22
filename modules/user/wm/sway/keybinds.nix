{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway.config.keybindings = let
    flameshot = lib.getExe pkgs.flameshot;
    xdg-user-dir = "~/pictures";
  in
    lib.mkOptionDefault {
      ## Screenshot
      "Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} gui -c -p ${xdg-user-dir}"; # Manually select a region
      "Shift+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} screen -c -p ${xdg-user-dir}"; # Current screen
      "Alt+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} full -c -p ${xdg-user-dir}"; # Full screen
      "Shift+Alt+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} screen -n 1 -c -p ${xdg-user-dir}"; # Screen 1
      "Ctrl+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} gui -c -p ${xdg-user-dir} -d 5000"; #Manually select a region with 5s delay
      "Ctrl+Shift+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} screen -c -p ${xdg-user-dir} -d 5000"; # Current screen with 5s delay
      "Ctrl+Alt+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} full -c -p ${xdg-user-dir} -d 5000"; # Full screen with 5s delay
      "Ctrl+Shift+Alt+Print" = "exec QT_QPA_PLATFORM=xcb ${flameshot} screen -n 1 -c -p ${xdg-user-dir} -d 5000"; # Screen 1 with 5s delay
    };
}
