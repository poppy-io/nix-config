{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [inputs.prismlauncher.packages.${pkgs.system}.prismlauncher];
}
