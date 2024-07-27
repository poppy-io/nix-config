{...}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  hardware.pulseaudio.enable = true;
}
