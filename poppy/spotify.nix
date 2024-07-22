{pkgs, ...}: {
  # use official client pending further work getting spotifyd working
  home.packages = with pkgs; [
    spotify
  ];
}
