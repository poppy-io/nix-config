{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (retroarch.withCores (
      cores: with cores; [
        beetle-saturn
        flycast
        swanstation
      ]))
  ];
}
