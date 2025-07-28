{pkgs, ...}: {
  users.users.poppy.extraGroups = ["kvm" "adbusers"];
  environment.systemPackages = with pkgs; [android-studio kotlin];

  programs.adb.enable = true;

  #virtualisation.waydroid.enable = true;
}
