{inputs, pkgs, ...}: {
  home.packages = [ inputs.dusklight.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
