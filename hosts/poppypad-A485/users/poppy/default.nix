{pkgs, ...}: let
  usrmodules = ./. + "/../../../../modules/user";
in {
  imports =
    map (x: "${usrmodules}" + x) [
      "/wm"
      "/git.nix"
      "/spotify.nix"
      "/kitty.nix"
      "/stylix.nix"
      "/nushell"
      "/firefox.nix"
      "/floorp.nix"
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
      kitty
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
