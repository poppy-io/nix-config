{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    settings = {
      custom-shader = "${./bettercrt.glsl}";
      window-padding-x = 5;
    };
  };
}
