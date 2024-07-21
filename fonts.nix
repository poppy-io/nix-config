{ pkgs, ...}:

{
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
          "IosevkaTerm Nerd Font"
          "Sarasa Gothic"
        ];

        serif = [
          "IosevkaTermSlab Nerd Font"
          "Sarasa Gothic"
        ];
      };
    };
  };
}
