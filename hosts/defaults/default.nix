{pkgs, ...}: let
  sysmodules = ./. + "/../../modules/system";
in {
  imports = map (x: "${sysmodules}" + x) [
    "/caching.nix"
    "/just.nix"
    "/gc.nix"
    "/nh.nix"
    "/portals.nix"

    "/boot.nix"
    "/greetd.nix"

    "/tty.nix"

    "/bluetooth.nix"
    "/networking.nix"
    "/audio.nix"

    "/fonts.nix"
    "/i18n"
    "/theming"

    "/mpdscribble.nix"
  ];

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    ripgrep
    htop
    comma
    gh
    nss
  ];

  users.defaultUserShell = pkgs.nushell;

  users.users.poppy = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = "1";
    }
  ];

  home-manager.backupFileExtension = "backup";

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  # required for fcitx5
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  ## replaced with nh; see /modules/system/nh.nix
  ## was buggy and shell-dependent anyway
  # show pretty nushell diff results
  #system.activationScripts.diff = ''
  #  if [[ -e /run/current-system ]]; then
  #    echo
  #    ${pkgs.nushell}/bin/nu -c "let diff_closure = ${pkgs.nix}/bin/nix store diff-closures /run/current-system '$systemConfig'; if \$diff_closure != \"\" {
  #      let table = \$diff_closure
  #      | lines
  #      | where \$it =~ KiB
  #      | where \$it =~ →
  #      | parse -r '^(?<Package>\S+): (?<Old_Version>[^,]+)(?:.*) → (?<New_Version>[^,]+)(?:.*, )(?<DiffBin>.*)$'
  #      | insert Diff {
  #        get DiffBin
  #        | ansi strip
  #        | str trim -l -c '+'
  #        | into filesize
  #      }
  #      | reject DiffBin
  #      | sort-by -r Diff; print \$table; \$table
  #      | math sum
  #    }"
  #  fi
  #'';
}
