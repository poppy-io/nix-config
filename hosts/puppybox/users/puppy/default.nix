{pkgs, ...}: let
  usrmodules = ./. + "/../../../../modules/user";
in {
  imports =
    map (x: "${usrmodules}" + x) [
      "/xivlauncher.nix"
      "/ebooks/calibre.nix"
      "/ebooks/sftp.nix"
      "/streaming/"
    ]
    ++ [
      ../../../defaults/users/puppy.nix
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

      xdelta
      p7zip
      xivlauncher
      sway-contrib.grimshot # screenshot tool
      vlc
      #wayrecord  # screenrecord tool

      jdk8
      onlyoffice-desktopeditors
    ];
  };

  home.stateVersion = "24.05";
}
