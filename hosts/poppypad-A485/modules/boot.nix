{lib,...}: {
  boot.loader = {
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  services.greetd.enable = lib.mkForce false;
}