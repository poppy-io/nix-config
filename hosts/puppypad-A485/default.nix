let
  sysmodules = ./. + "../../modules/system";
in {
  networking.hostName = "puppypad-A485";
  services.logrotate.checkConfig = false;

  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ]
    ++ map (x: "${sysmodules}" + x) [];

    system.stateVersion = "23.11";
}
