{
  services.openvpn.servers = {
    jp = {
      config = "${./jp-proton.conf}";
      autoStart = false;
    };
  };
}
