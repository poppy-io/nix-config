{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ melonds ];
}
