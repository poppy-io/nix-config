{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  environment.systemPackages = [pkgs.adwaita-icon-theme];

  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = "https://www.jame-world.com/media/image/2004-00/1643.jpg";
      sha256 = "Mh6P/DWg9AozNyPm/RzpBCc30uHf7FIW8pDc8D2Q/oM=";
    };
    polarity = "light";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";

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
        package = pkgs.manrope;
        name = "Manrope";
      };

      monospace = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "IosevkaTerm Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
