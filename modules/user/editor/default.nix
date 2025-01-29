{
  imports = [./vscode.nix ./jetbrains.nix];

  home.sessionVariables.EDITOR = "emacs";
  xdg.mimeApps.defaultApplications."text/plain" = "emacs.desktop";
}
