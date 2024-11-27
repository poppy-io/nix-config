{
  # not at user level because its missing in home manager
  services.mpdscribble = {
    enable = true;
    endpoints."last.fm" = {
      username = "poppy_io";
      passwordFile = "/home/poppy/nix-config/secrets/lastfm.txt";
    };
  };
}
