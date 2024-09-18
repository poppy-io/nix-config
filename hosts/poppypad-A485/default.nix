{self, ...}: let
  sysmodules = ./. + "../../modules/system";
in {
  networking.hostName = "poppypad-A485";

  imports = [
    ./hardware-configuration.nix
    ./modules
  ];
}
