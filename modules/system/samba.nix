{pkgs, ...}: {
  environment.systemPackages = with pkgs; [cifs-utils];
  services.gvfs.enable = true;

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
}
