{pkgs, ...}: {
  imports = [
    ./de.nix
    ./zh.nix
    ./ja.nix
    ./ko.nix
  ];

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    inputMethod.enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
    ];
  };

  # use equivalent BAC timezone due to lack of Scottish option
  time.timeZone = "Europe/Dublin";
}
