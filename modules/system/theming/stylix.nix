{
  inputs,
  pkgs,
  ...
}: let
  inputImage = builtins.fetchurl {
    url="https://img2.gelbooru.com/images/fa/15/fa1592597e895a0db166365a0a8af257.jpg";
    sha256="sha256:0idxvsayzj6g9ll56sxhvbbsq0q0k5qxnib5g8yrx1wfhfqkzy7p";
  };
  colourscheme = "zenburn";
  theme = "${pkgs.base16-schemes}/share/themes/${colourscheme}.yaml";
in {
  imports = [inputs.stylix.nixosModules.stylix];

  environment.systemPackages = [pkgs.adwaita-icon-theme];

  stylix = {
    enable = true;
    base16Scheme = theme;

    image = pkgs.runCommand "image.png" {buildInputs = [pkgs.lutgen];} ''
      lutgen apply -s 128 ${inputImage} -o $out -p ${colourscheme};
    '';

    #opacity = {
    #  applications = 0.7;
    #  desktop = 0.7;
    #  popups = 0.6;
    #  terminal = 0.7;
    #};

    cursor = {
      package = pkgs.openzone-cursors;
      name = "OpenZone_Black";
      size = 24;
    };

    fonts = {
      serif = {
        package = pkgs.prociono;
        name = "Prociono";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.ubuntu;
        name = "Ubuntu Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "IosevkaTerm Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
