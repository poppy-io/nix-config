{
  prismlauncher,
  pkgs,
  ...
}: {
  environment.systemPackages = [prismlauncher.packages.${pkgs.system}.prismlauncher];
}
