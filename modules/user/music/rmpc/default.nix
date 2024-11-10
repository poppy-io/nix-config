{pkgs, ...}: {
  home.packages = [pkgs.rmpc];

  xdg.configFile."rmpc/config.ron".source = ./config.ron;
  xdg.configFile."rmpc/theme.ron".source = ./theme.ron;
}
