{...}: {
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
    doomLocalDir = "~/.local/share/nix-doom";
  };
}
