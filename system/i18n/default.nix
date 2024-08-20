{pkgs, ...}: {
  imports = [
    ./de.nix
    ./zh.nix
    ./ja.nix
    ./ko.nix
  ];

  i18n = {
    defaultLocale = "en_GB.UTF-8/UTF-8";

    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-rose-pine # colour theme; consider also fcitx5-nord or fcitx5-material-color
        ];
      };
    };
  };

  # use equivalent BÁC timezone due to lack of Scottish option
  time.timeZone = "Europe/Dublin";
}
