{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (bottles.override { removeWarningPopup = true; })
    wine
    winetricks
  ];
}
