{pkgs, ...}: {
  home.packages = with pkgs; [picard chromaprint];
}