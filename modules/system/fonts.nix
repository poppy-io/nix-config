{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      sarasa-gothic
      ipafont
      (nerdfonts.override {
        fonts = [
          "IosevkaTerm"
          "IosevkaTermSlab"
        ];
      })
      noto-fonts-emoji
      noto-fonts
      prociono
      eurofurence
      manrope
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
          "Manrope"
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
