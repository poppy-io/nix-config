{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "~/dev/dao/dao yc";
  };

  home.shell.enableZshIntegration = true;
}
