{pkgs, ...}: let
  sysmodules = ./. + "/../../modules/system";
in {
  imports = map (x: "${sysmodules}" + x) [
    "/caching.nix"
    "/just.nix"
    "/gc.nix"
    "/nh.nix"
    "/portals.nix"
    "/docker.nix"
    "/ssh.nix"
    "/secrets.nix"

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
    git-lfs
    curl
    wget
    ripgrep
    htop
    comma
    gh
    nss
  ];

  users.defaultUserShell = pkgs.bash;

  users.users.puppy = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "docker"];
  };

  users.users.poppy = {
    isNormalUser = true;
    extraGroups = [];
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

  # required for uv
  environment.localBinInPath = true;
}
