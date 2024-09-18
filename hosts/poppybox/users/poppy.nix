{
  self,
  pkgs,
  ...
}: let
  modules = "${self}/modules";
in {
  imports = map (x: "${modules}" + x) [
    /wm
    /git.nix
    /spotify.nix
    /kitty.nix
    /stylix.nix
    /nushell
    /firefox.nix
    /floorp.nix
    /yazi.nix
    /i3status.nix
  ];

  home = {
    packages = with pkgs; [
      kitty
      hyfetch
      wmenu
      vesktop
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
