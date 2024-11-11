{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/share/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipewire"
      }
    '';

    network.startWhenNeeded = true;
  };
}
