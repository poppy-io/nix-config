{
  pkgs,
  emacs-overlay,
  ...
}: {
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
  };
}
