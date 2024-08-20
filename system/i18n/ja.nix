{pkgs, ...}: {
  i18n = {
    supportedLocales = ["ja_JP.UTF-8"];

    i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [anthy];
  };
}
