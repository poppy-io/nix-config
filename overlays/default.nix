{
  nixpkgs.overlays = [
    (import ./flameshot.nix)
  ];
}
