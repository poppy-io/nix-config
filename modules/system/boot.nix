{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = true;
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
    };

    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    #loader.timeout = 0;
  };
}
