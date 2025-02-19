{ pkgs, ...}:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
      wrapfig amsmath ulem hyperref capt-of # org-mode requirements
      minted
      upquote;
  });
in
{
  environment.systemPackages = [
    tex
  ];
}
