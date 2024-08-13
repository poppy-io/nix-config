{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./networking.nix
    ./steam.nix
    ./boot.nix
    ./stylix.nix
    ./vscode.nix
    ./greetd.nix
    ./nushell.nix
    ./bluetooth.nix
    ./android.nix
    ./games
  ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 32 * 1024; # 32GB
    }
  ];

  security.polkit.enable = true;

  system.autoUpgrade.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "uk";
    useXkbConfig = true; # use xkb.options in tty.
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
  ];
  xdg.portal.config.common.default = "wlr";

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.poppy = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    swayfx
    transmission_4-gtk
    ryujinx
  ];

  # List services that you want to enable:
  # services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
