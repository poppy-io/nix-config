{...}: {
  programs.nushell = {
    configFile.source = ./config.nu;
    extraConfig = ''
      let carapace_completer = {|spans|
      carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
        show_banner: false
        completions: {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"

          external: {
            enable: true  # find suggestions in path
            max_results: 100
            completer: $carapace_completer
          }
        }
      }

      $env.PATH = ($env.PATH |
      split row (char esep) |
      prepend /home/myuser/.apps |
      append /usr/bin/env
      )
    '';

    shellAliases = {
      doas = "sudo";
      please = "sudo";
      nrb = "sudo nixos-rebuild switch";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[:3](bold green)";
        error_symbol = "[:3](bold red)";
      };
    };
  };
}
