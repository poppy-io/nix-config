{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
    nss  # dependency of godforsaken "electron embedded framework for minecraft"
  ];
}
