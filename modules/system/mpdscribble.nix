{config, ...}: {
  # not at user level because its missing in home manager

  
  
  services.mpdscribble = {
    enable = false;
    endpoints."last.fm" = {
      username = "poppy_io";
      #passwordFile = config.age.secrets.lastfm.path;
    };
  };
}
