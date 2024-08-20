{pkgs, ...}: {
  i18n = {
    supportedLocales = ["ja_JP.UTF-8/UTF-8"];

    inputMethod.fcitx5.addons = with pkgs; [fcitx5-mozc];
  };
}
