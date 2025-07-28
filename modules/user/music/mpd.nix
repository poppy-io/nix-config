{
  # make sure to also add system/mpdscribble.nix for scrobbling!
  services.mpd = {
    enable = true;
    musicDirectory = "/home/puppy/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "music_pipewire"
        buffer_time "100000"
      }

      audio_output {
        type "fifo"
        name "music_visualiser_fifo"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
        buffer_time "100000"
        filters "visualiser_normalise"
      }

      filter {
        plugin "normalize"
        name "visualiser_normalise"
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
