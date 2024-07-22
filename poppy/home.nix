{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sway/sway.nix
    ./vscode.nix
    ./git.nix
    ./spotify.nix
  ];

  home.username = "poppy";
  home.homeDirectory = "/home/poppy";

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
      EDITOR = "nano";
      TERMINAL = "kitty";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      XDG_CONFIG_HOME = config.xdg.configHome;
      XDG_CACHE_HOME = config.xdg.cacheHome;
      XDG_DATA_HOME = config.xdg.dataHome;
      XDG_STATE_HOME = config.xdg.stateHome;
      NIXOS_OZONE_WL = "1"; # required by VSCode under wayland
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib"; # should be done automatically but make explicit just in case
    };

    packages = with pkgs; [
      kitty
      wmenu
      vesktop
      clinfo
      wineWowPackages.waylandFull
      winetricks
      unrar
      lutris
      (retroarch.override {
        cores = with libretro; [
          beetle-saturn
        ];
      })
      xdelta
      p7zip
      adwaita-icon-theme # for lutris
      ungoogled-chromium
      xivlauncher
      sway-contrib.grimshot # screenshot tool
      #wayrecord  # screenrecord tool
      alejandra
      nixd
      gh
    ];
  };

  systemd.user.startServices = true;

  home.stateVersion = "24.05";
}
