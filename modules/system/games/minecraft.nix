{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher
    nss  # dependency of godforsaken "electron embedded framework for minecraft"
  ];
}
