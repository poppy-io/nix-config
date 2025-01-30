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
      "/discord.nix"
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
      p7zip
      vlc
      quodlibet
      onlyoffice-bin
    ];
  };

  home.stateVersion = "24.05";
}
