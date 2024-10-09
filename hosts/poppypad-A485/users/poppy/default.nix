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

      "/git.nix"
      "/spotify.nix"
      "/stylix.nix"
      "/yazi.nix"
      "/i3status.nix"
      "/discord.nix"
    ]
    ++ [
      ../../../common/users/poppy.nix
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
}
