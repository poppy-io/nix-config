{pkgs, ...}: {
  #services.gvfs.enable = true;
  home.packages = with pkgs; [ nautilus ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "nautilus.desktop";
  };
}