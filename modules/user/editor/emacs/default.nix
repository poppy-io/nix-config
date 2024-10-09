{pkgs, ...}: {
  home.packages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.el;
      defaultInitFile = true;
      package = pkgs.emacs-pgtk;
    })
  ];
}
