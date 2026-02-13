{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ duckstation ];
}
