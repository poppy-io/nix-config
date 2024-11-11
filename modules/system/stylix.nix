{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = "https://www.jame-world.com/media/image/2004-00/1643.jpg";
      sha256 = "Mh6P/DWg9AozNyPm/RzpBCc30uHf7FIW8pDc8D2Q/oM=";
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/brushtrees.yaml";

    #opacity = {
    #  applications = 0.7;
    #  desktop = 0.7;
    #  popups = 0.6;
    #  terminal = 0.7;
    #};

    fonts = {
      serif = {
        package = pkgs.prociono;
        name = "Prociono";
      };

      sansSerif = {
        package = pkgs.manrope;
        name = "Manrope";
      };

      monospace = {
        package = pkgs.nerdfonts.override {
          fonts = [
            "IosevkaTerm"
          ];
        };
        name = "IosevkaTerm Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
