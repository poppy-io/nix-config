{
  imports = [./emacs ./vscode.nix];

  home.sessionVariables.EDITOR = "nano";
  xdg.mimeApps.defaultApplications."text/plain" = "nano.desktop";
}
