{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = "https://64.media.tumblr.com/6311cba4718459408cba35d6e676a80e/tumblr_n2oztnaz4W1suezzpo1_500.jpg";
      sha256 = "0i6hv60sj0lg42kcm6b02kvih011ibk34mxsxyyigjh6143lbhr3";
    };
    polarity = "light";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/danqing.yaml";

    opacity = {
      applications = 0.7;
      desktop = 0.7;
      popups = 0.6;
      terminal = 0.7;
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

    cursor = {
      package = pkgs.hackneyed;
      name = "Hackneyed Dark";
    };
  };
}
