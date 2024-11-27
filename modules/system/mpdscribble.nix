{
  # not at user level because its missing in home manager
  services.mpdscribble = {
    enable = true;
    endpoints.lastfm = {
      username = "poppy_io";
      passwordFile = ./../../../secrets/lastfm.txt;
    };
  };
}
