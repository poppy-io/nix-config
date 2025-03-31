{
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.grub.configurationLimit = 10;

  ## replaced with nh; see ./nh.nix
  #nix.gc = {
  #  automatic = true;
  #  dates = "weekly";
  #  options = "--delete-older-than 14d";
  #};

  nix.settings.auto-optimise-store = true;
}
