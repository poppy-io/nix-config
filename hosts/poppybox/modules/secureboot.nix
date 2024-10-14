{
  lib,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = lib.mkForce false;

  environment.systemPackages = [pkgs.sbctl];
}
