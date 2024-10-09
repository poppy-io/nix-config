{pkgs, ...}: {
  programs.nushell = {
    enable = true;

    configFile.source = ./config.nu;
    envFile.source = ./env.nu;

    extraConfig = ''

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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = true;
  };

  home.packages = with pkgs; [
    nu_scripts
  ];
}
