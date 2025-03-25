{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./emacs.el;
      defaultInitFile = true;
      alwaysEnsure = true;
      package = pkgs.emacs-git-pgtk;
    })

    # language servers
    texlivePackages.digestif
    nil
    basedpyright

    alejandra # nix formatter
    gh # github cli
    textidote

    emacs-all-the-icons-fonts
  ];
}
