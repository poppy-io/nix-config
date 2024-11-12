{pkgs, ...}: {
  # use proprietary client cause nicotine crashes nonstop :(
  home.packages = [pkgs.soulseekqt];
}
