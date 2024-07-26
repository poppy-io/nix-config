{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config.allowUnfree = true;

  system.activationScripts.diff = ''
    if [[ -e /run/current-system ]]; then
      echo
      ${pkgs.nushell}/bin/nu -c "let diff_closure = ${pkgs.nix}/bin/nix store diff-closures /run/current-system '$systemConfig'; if \$diff_closure != \"\" {
        let table = \$diff_closure
        | lines
        | where \$it =~ KiB
        | where \$it =~ →
        | parse -r '^(?<Package>\S+): (?<Old_Version>[^,]+)(?:.*) → (?<New_Version>[^,]+)(?:.*, )(?<DiffBin>.*)$'
        | insert Diff {
          get DiffBin
          | ansi strip
          | str trim -l -c '+'
          | into filesize
        }
        | reject DiffBin
        | sort-by -r Diff; print \$table; \$table
        | math sum
      }"
    fi
  '';

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
