{ pkgs, ...}:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      wrapfig amsmath ulem hyperref capt-of # org-mode requirements
      minted;
  });
in
{
  environment.systemPackages = with pkgs; [
    tex
  ];
}
