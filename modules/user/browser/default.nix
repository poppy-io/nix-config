{
  imports = [./floorp.nix];

  xdg.mime.defaultApplications = let
    default_browser = "floorp.desktop";
  in {
    "text/html" = default_browser;
    "x-scheme-handler/http" = default_browser;
    "x-scheme-handler/https" = default_browser;
    "x-scheme-handler/ftp" = default_browser;
    "x-scheme-handler/chrome" = default_browser;
    "x-scheme-handler/about" = default_browser;
    "x-scheme-handler/unknown" = default_browser;
    "application/x-extension-htm" = default_browser;
    "application/x-extension-html" = default_browser;
    "application/x-extension-shtml" = default_browser;
    "application/xhtml+xml" = default_browser;
    "application/x-extension-xhtml" = default_browser;
    "application/x-extension-xht" = default_browser;
  };

  home.sessionVariables.DEFAULT_BROWSER = "floorp";
}
