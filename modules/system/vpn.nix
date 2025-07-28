{pkgs, ...}: {
  environment.systemPackages = with pkgs; [openfortivpn protonvpn-gui];
}
