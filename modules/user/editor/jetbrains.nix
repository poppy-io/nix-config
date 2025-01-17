{pkgs, ...}: {
  # temporary stopgap while i get more comfortable with emacs
  home.packages = with pkgs.jetbrains; [pycharm-community];
}
