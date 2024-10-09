{
  imports = [./nushell ./bash];

  home.shellAliases = {
    doas = "sudo";
    please = "sudo";
    nrb = "sudo nixos-rebuild switch";
  };

  # see /hosts/defaults/default.nix for default shell options; can't set at user level
}
