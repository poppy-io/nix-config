{
  inputs,
  pkgs,
  config,
  ...
}: let
  inputImage = pkgs.fetchurl {
    url = "https://imgv2-2-f.scribdassets.com/img/document/554161533/original/5f83777e82/1?v=1";
    sha256 = "sha256-VIWzmJlgHW3N5QbObi0D7ZBjQR9RW7yhxNOaryJHeok=";
  };
  colourscheme = "ayu-light";
  theme = "${pkgs.base16-schemes}/share/themes/${colourscheme}.yaml";
in {
  imports = [inputs.stylix.nixosModules.stylix];

  environment.systemPackages = [pkgs.adwaita-icon-theme];

  stylix = {
    enable = true;
    base16Scheme = theme;

    image = pkgs.runCommandNoCC "image.png" {buildInputs = [pkgs.lutgen pkgs.imagemagick];} ''
      lutgen apply -s 36 ${inputImage} -o image1.png -p ${colourscheme};
      magick image1.png -gravity center -background "${config.lib.stylix.colors.withHashtag.base00}" -frame 1440x2560 $out
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
