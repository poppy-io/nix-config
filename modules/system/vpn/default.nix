{pkgs, ...}: {
  services.resolved.enable = true;
  
  environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
  environment.systemPackages = with pkgs; [ update-resolv-conf ];
  
  services.openvpn.servers = {
    jp = {
      config = "config ${./jp-gate.conf}";
      autoStart = false;
      updateResolvConf = true;
      authUserPass = {
        username = "vpn";
        password = "vpn";
      };
    };

    ph = {
      config = "config ${./ph-gate.conf}";
      autoStart = false;
      updateResolvConf = true;
      authUserPass = {
        username = "vpn";
        password = "vpn";
      };
    };
  };
}
