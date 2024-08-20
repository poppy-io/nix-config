{pkgs, ...}: {
  i18n.supportedLocales = ["zh_CN.UTF-8"];

  inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-chinese-addons
  ];
}
