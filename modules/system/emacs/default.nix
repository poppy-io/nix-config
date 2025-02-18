{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.el;
      defaultInitFile = true;
      alwaysEnsure = true;
      package = pkgs.emacs-pgtk;
    })

    # language servers
    texlivePackages.digestif
    nil
  ];
}
