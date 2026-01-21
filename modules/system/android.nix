{pkgs, ...}: {
  users.users.poppy.extraGroups = ["kvm" "adbusers"];
  environment.systemPackages = with pkgs; [android-studio kotlin];

  #virtualisation.waydroid.enable = true;
}
