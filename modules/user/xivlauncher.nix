{pkgs, ...}: {
  home.packages = [pkgs.xivlauncher];

  home.shellAliases = {
    xivlauncher = "XIVLauncher.Core";
  };
}
