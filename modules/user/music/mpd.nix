{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/share/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "music_pipewire"
      }

      audio_output {
        type "fifo"
        name "music_visualiser_fifo"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
      }

      playlist_plugin {
        name "cue"
        enabled "false"
      }

      replaygain "auto"
    '';

    network.startWhenNeeded = true;
  };

  services.mpdris2 = {
    enable = true;
  };
}
