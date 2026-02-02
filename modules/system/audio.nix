{pkgs, ...}: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    
    extraConfig.pipewire = {
      "20-loopback-sink" = {
        "context.modules" = [
          { "name" = "libpipewire-module-loopback";
            "args" = {
              "node.description" = "Headphones";
              "capture.props" = {
                "node.name" = "Headphones";
                "media.class" = "Audio/Sink";
                "audio.position" = [ "FL" "FR" ];
              };
              "playback.props" = {
                "node.name" = "playback.Headphones";
                "audio.position" = [ "AUX2" "AUX3" ];
                "target.object" = "alsa_output.usb-Generic_USB_Audio-00.Hifi_7_1__Speaker__sink";
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
            };
          }
        ];
      };
    };
  };

  environment.systemPackages = [
    pkgs.pavucontrol
  ];
}
