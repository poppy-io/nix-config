{pkgs, inputs, ...}:
{
  environment.systemPackages = [inputs.unofficial-homestuck-collection.packages.${pkgs.system}.unofficial-homestuck-collection];
}