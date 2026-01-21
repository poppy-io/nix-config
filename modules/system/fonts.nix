{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      sarasa-gothic
      ipafont
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
      noto-fonts-color-emoji
      noto-fonts
      prociono
      eurofurence
      nerd-fonts.ubuntu
    ];

    fontconfig = {
      enable = true;
      cache32Bit = true;
      subpixel.rgba = "rgb";

      defaultFonts = {
        monospace = [
          "IosevkaTerm Nerd Font"
          "Sarasa Gothic"
        ];

        sansSerif = [
          "Ubuntu Nerd Font"
          "IosevkaTerm Nerd Font"
          "Sarasa Gothic"
        ];

        serif = [
          "Prociono"
          "IosevkaTermSlab Nerd Font"
          "Sarasa Gothic"
        ];
      };
    };
  };
}
