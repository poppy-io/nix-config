{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

  services.arrpc.enable = true;
}
