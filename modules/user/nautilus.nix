{pkgs, ...}: {
  #services.gvfs.enable = true;
  home.packages = with pkgs; [ nautilus ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "nautilus.desktop";
  };

  xdg.portal.config.common = {
    "org.freedesktop.impl.portal.FileChooser" = "nautilus";
  };
}