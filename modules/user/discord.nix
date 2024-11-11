{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

  services.arrpc.enable = true; # rich presence server
  services.mpd-discord-rpc.enable = true; # mpd rich presence integration
}
