{pkgs, ...}: {
  users.users.poppy.extraGroups = ["kvm" "adbusers"];
  environment.systemPackages = with pkgs; [android-studio kotlin];

  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
