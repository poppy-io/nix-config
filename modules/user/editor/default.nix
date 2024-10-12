{
  imports = [./vscode.nix];

  home.sessionVariables.EDITOR = "emacs";
  xdg.mimeApps.defaultApplications."text/plain" = "emacs.desktop";
}
