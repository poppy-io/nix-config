{
  programs.starship = {
    enable = true;
    
    settings = {
      add_newline = true;

      character = {
        success_symbol = "[:3](bold green)";
        error_symbol = "[:3](bold red)";
      };

      direnv.disabled = false;
    };
    
  };
}
