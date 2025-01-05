{pkgs, ...}: {
  # use proprietary client cause nicotine crashes nonstop :(
  home.packages = with pkgs; [
    soulseekqt
    #flacon  temp disable due to build issues
  ];
}
