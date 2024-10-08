{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        #ms-python.python
        #ms-python.isort
        #ms-python.debugpy
        #ms-python.black-formatter
        #ms-pyright.pyright
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
        redhat.vscode-yaml
        thenuprojectcontributors.vscode-nushell-lang
      ];
    })

    alejandra # nix formatter
    nil # nix language server
    gh # github cli
    jq # json
  ];
}
