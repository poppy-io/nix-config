{...}: let
  sysmodules = ./. + "/../../modules/system";
in {
  networking.hostName = "poppybox";

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ]
    ++ map (x: "${sysmodules}" + x) [
      "/steam.nix"
      "/android.nix"
      "/torrent.nix"
      "/bottles.nix"
      "/vpn.nix"

      "/games/hk3"
      "/games/zzz"
      "/games/hsr"
      "/games/agl"

      "/games/retroarch.nix"
      "/games/ryujinx.nix"
    ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
