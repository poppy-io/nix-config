{config, ...}: let
  usrmodules = ./. + "../../../modules/user";
in {
  home.username = "poppy";
  home.homeDirectory = "/home/poppy";

  # imports = map (x: "${usrmodules}" + x) [];

  programs = {
    home-manager.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        doas = "sudo";
        please = "sudo";
        nrb = "sudo nixos-rebuild switch";
      };
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "emacs";
      TERMINAL = "kitty";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      XDG_CONFIG_HOME = config.xdg.configHome;
      XDG_CACHE_HOME = config.xdg.cacheHome;
      XDG_DATA_HOME = config.xdg.dataHome;
      XDG_STATE_HOME = config.xdg.stateHome;
      NIXOS_OZONE_WL = "1"; # required by VSCode under wayland
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib"; # should be done automatically but make explicit just in case
    };
  };

  systemd.user.startServices = true;
}
