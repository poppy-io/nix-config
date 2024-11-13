{pkgs, ...}: {
  imports = [
    ./de.nix
    ./zh.nix
    ./ja.nix
    ./ko.nix
  ];

  i18n = {
    supportedLocales = [
      "C.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
    ];

    defaultLocale = "en_GB.UTF-8";

    #inputMethod = {
    #  enabled = "fcitx5";
    #  fcitx5 = {
    #    waylandFrontend = true;
    #    addons = with pkgs; [
    #      fcitx5-gtk
    #      fcitx5-rose-pine # colour theme; consider also fcitx5-nord or fcitx5-material-color
    #    ];
    #  };
    #};
  };

  # use equivalent BÁC timezone due to lack of Scottish option
  time.timeZone = "Europe/Dublin";
}
