{pkgs, inputs, ...}:
{
  environment.systemPackages = [inputs.unofficial-homestuck-collection.packages.${pkgs.stdenv.hostPlatform.system}.unofficial-homestuck-collection];
}
