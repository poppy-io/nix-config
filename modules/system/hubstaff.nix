{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hubstaff
  ];
}
