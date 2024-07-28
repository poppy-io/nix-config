{...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    # package = pkgs.steam.override {
    #  withPrimus = true;
    #  withJava = true;
    #  extraPkgs = pkgs: [ bumblebee glxinfo ];
    # };
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
}
