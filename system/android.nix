{pkgs, ...}: {
  users.users.poppy.extraGroups = ["kvm" "adbusers"];
  environment.systemPackages = [pkgs.android-studio];

  programs.adb.enable = true;
}
