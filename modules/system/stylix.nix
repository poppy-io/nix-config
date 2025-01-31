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
      FILL_COL="$(magick ${inputImage} -format "%[hex:u.p{50,50}]\n" info:)"
      magick ${inputImage} -gravity center -background $FILL_COL -frame 1080x1920 image1.png
      lutgen apply -s 36 image1.png -o $out -p ${colourscheme};

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
