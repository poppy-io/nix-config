{
  networking.nameservers = [
    "1.1.1.1"
    "9.9.9.9"
  ];
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # soulseek
      2416
      59197
      59198

      9090 # calibre
    ];
  };
}
