{pkgs, ...}: {
  environment.systemPackages = with pkgs; [openfortivpn protonvpn-cli_2];
}
