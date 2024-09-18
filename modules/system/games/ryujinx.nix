{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ryujinx
  ];
}
