{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];

    config.common.default = ["wlr" "gtk"];
    wlr.enable = true;
  };

  #services.gvfs.enable = true;

  #home.packages = with pkgs; [gtk3];
}
