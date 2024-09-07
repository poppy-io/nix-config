{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.miracle-wm}/bin/miracle-wm";
        user = "poppy";
      };
      default_session = initial_session;
    };
  };
}
