{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      ms-python.python
      ms-python.isort
      ms-python.debugpy
      ms-python.black-formatter
      ms-pyright.pyright
      yzhang.markdown-all-in-one
      wakatime.vscode-wakatime
      vscode-icons-team.vscode-icons
      vscjava.vscode-java-pack
      uloco.theme-bluloco-light
      # tuttieee.emacs-mcx
      tomoki1207.pdf
      timonwong.shellcheck
      tamasfe.even-better-toml
      shardulm94.trailing-spaces
      serayuzgur.crates
      seatonjiang.gitmoji-vscode
      scala-lang.scala
      njpwerner.autodocstring
      mattn.lisp
      mathiasfrohlich.kotlin
    ];
  };
}
