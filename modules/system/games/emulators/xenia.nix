{pkgs, ...}: {
  environment.systemPackages = with pkgs; [xenia-canary];
}
