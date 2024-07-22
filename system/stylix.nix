{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = "https://img3.gelbooru.com/images/19/9e/199ead05a0eee4d85d4f65076a379a28.jpg";
    };
    polarity = "light";

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
