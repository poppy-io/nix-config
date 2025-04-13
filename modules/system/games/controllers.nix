{pkgs, ...}: {
  hardware.uinput.enable = true;
  
  services.udev = {
    enable = true;
    
    packages = with pkgs; [
      game-devices-udev-rules
    ];
  };
}
