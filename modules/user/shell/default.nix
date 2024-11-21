{
  imports = [./nushell ./bash];

  home.shellAliases = {
    doas = "sudo";
    please = "sudo";
  };

  # see /hosts/defaults/default.nix for default shell options; can't set at user level
}
