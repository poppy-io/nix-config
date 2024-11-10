{pkgs, ...}: {
  environment.systemPackages = with pkgs; [cifs-utils];
  fileSystems."/mnt/share/music" = {
    device = "//EXENEBOX/Music";
    fsType = "cifs";

    options = let
      # prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts}"];
  };

  services.gvfs.enable = true;

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
}
