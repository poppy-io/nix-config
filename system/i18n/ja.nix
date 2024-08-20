{pkgs, ...}: {
  i18n = {
    supportedLocales = ["ja_JP.UTF-8/UTF-8"];

    inputMethod.ibus.engines = with pkgs.ibus-engines; [mozc];
  };
}
