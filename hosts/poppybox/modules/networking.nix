{...}: {
  # required for Borderlands 2 unusual LAN ports
  networking.firewall.allowedUDPPortRanges = [
    {
      from = 50000;
      to = 65535;
    }
  ];
}
