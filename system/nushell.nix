{pkgs, ...}: {
  programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;
}
