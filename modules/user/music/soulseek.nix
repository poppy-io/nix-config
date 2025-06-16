{pkgs, ...}: {
  # use proprietary client cause nicotine crashes nonstop :(
  home.packages = with pkgs; [
    nicotine-plus
    #flacon  temp disable due to build issues
  ];
}
