{pkgs, ...}: {
  home.packages = with pkgs; [
    calibre
  ];

  services.udisk2.enable = true;
}
