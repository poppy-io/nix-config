{inputs, ...}: {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.x86_64-linux.default;
    settings = {
      custom-shader = "${./bettercrt.glsl}";
      window-padding-x = 5;
    };
  };
}
