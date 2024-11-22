{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway.config.keybindings = let
    flameshot = pkgs.flameshot;
    xdg-user-dir = "~/pictures";
  in
    lib.mkOptionDefault {
      ## Screenshot
      "Print" = "exec ${flameshot} gui -c -p ${xdg-user-dir}"; # Manually select a region
      "Shift+Print" = "exec ${flameshot} screen -c -p ${xdg-user-dir}"; # Current screen
      "Alt+Print" = "exec ${flameshot} full -c -p ${xdg-user-dir}"; # Full screen
      "Shift+Alt+Print" = "exec ${flameshot} screen -n 1 -c -p ${xdg-user-dir}"; # Screen 1
      "Ctrl+Print" = "exec ${flameshot} gui -c -p ${xdg-user-dir} -d 5000"; #Manually select a region with 5s delay
      "Ctrl+Shift+Print" = "exec ${flameshot} screen -c -p ${xdg-user-dir} -d 5000"; # Current screen with 5s delay
      "Ctrl+Alt+Print" = "exec ${flameshot} full -c -p ${xdg-user-dir} -d 5000"; # Full screen with 5s delay
      "Ctrl+Shift+Alt+Print" = "exec ${flameshot} screen -n 1 -c -p ${xdg-user-dir} -d 5000"; # Screen 1 with 5s delay
    };
}
