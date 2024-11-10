{config, ...}: {
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/share/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipewire"
      }
    '';

    user = "poppy";

    network.startWhenNeeded = true;
  };

  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.poppy.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
  };
}
