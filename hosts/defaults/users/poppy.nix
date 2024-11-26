{config, ...}: let
  usrmodules = ./. + "../../../../modules/user";
in {
  home.username = "poppy";
  home.homeDirectory = "/home/poppy";

  imports = map (x: "${usrmodules}" + x) [
    "/shell"
    "/wm"
    "/editor"
    "/browser"
    "/terminal"
    "/music"

    "/numlock.nix"
    "/git.nix"
    "/stylix.nix"
    "/yazi.nix"
    "/discord.nix"
  ];

  programs = {
    home-manager.enable = true;
  };

  home = {
    sessionVariables = {
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      XDG_CONFIG_HOME = config.xdg.configHome;
      XDG_CACHE_HOME = config.xdg.cacheHome;
      XDG_DATA_HOME = config.xdg.dataHome;
      XDG_STATE_HOME = config.xdg.stateHome;
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib"; # should be done automatically but make explicit just in case
    };
  };

  xdg.mimeApps.enable = true;

  systemd.user.startServices = true;
}
