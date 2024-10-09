{
  imports = [./emacs];

  home.sessionVariables.EDITOR = "nano";
  xdg.mimeApps.defaultApplications."text/plain" = "nano.desktop";
}
