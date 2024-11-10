{pkgs, ...}: let
  usrmodules = ./. + "/../../../../modules/user";
in {
  imports =
    map (x: "${usrmodules}" + x) [
      "/shell"
      "/wm"
      "/editor"
      "/browser"
      "/terminal"
      "/music"

      "/git.nix"
      "/stylix.nix"
      "/yazi.nix"
      "/i3status.nix"
      "/discord.nix"
      "/xivlauncher.nix"
    ]
    ++ [
      ../../../defaults/users/poppy.nix
      ./modules
    ];

  home = {
    packages = with pkgs; [
      hyfetch
      wmenu
      clinfo
      wineWowPackages.waylandFull
      winetricks
      unrar
      lutris

      xdelta
      p7zip
      xivlauncher
      sway-contrib.grimshot # screenshot tool
      vlc
      quodlibet
      #wayrecord  # screenrecord tool

      jdk8
      onlyoffice-bin
    ];
  };

  home.stateVersion = "24.05";
}
