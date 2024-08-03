{inputs, ...}: {
  imports = [
    inputs.aagl.nixosModules.default
    ./hk3
    ./zzz
    ./hsr
    ./retroarch.nix
  ];
}
