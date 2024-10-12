{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.el;
      defaultInitFile = true;
      alwaysEnsure = true;
      package = pkgs.emacs-pgtk;
    })
  ];
}
