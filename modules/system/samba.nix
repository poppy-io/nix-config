{pkgs, ...}: {
  environment.systemPackages = with pkgs; [cifs-utils];
  fileSystems."/mnt/share/music" = {
    device = "//192.168.0.27/Music";
    fsType = "cifs";

    options = let
      # prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},uid=1000,gid=1,ro"];
    # FIXME: root still required to write
  };

  fileSystems."/mnt/share/music-staging" = {
    device = "//192.168.0.27/Music-staging";
    fsType = "cifs";

    options = let
      # prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},uid=1000,gid=1,rw"];
    # FIXME: hardcoded uid
  };

  services.gvfs.enable = true;

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
}
