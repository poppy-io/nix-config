{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/share/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipewire"
      }

      playlist_plugin {
        name "cue"
        enabled "false"
      }
    '';

    network.startWhenNeeded = true;
  };
}
