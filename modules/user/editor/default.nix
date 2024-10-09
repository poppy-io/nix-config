{
  imports = [./emacs ./vscode];

  home.sessionVariables.EDITOR = "nano";
  xdg.mimeApps.defaultApplications."text/plain" = "nano.desktop";
}
