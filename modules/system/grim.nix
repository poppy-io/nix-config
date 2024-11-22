{pkgs, ...}: {
  # TEMPORARY WORKAROUND FOR FLAMESHOT OVERLAY GARBAGE
  environment.systemPackages = with pkgs; [grim];
}
