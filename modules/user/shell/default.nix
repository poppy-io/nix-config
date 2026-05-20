{
  imports = [
    ./zsh
    
    ./carapace.nix
    ./direnv.nix
    ./starship.nix 
  ];

  home.shellAliases = {
    doas = "sudo";
    please = "sudo";
    memflush = "sudo sh -c \"sync; echo 1 > /proc/sys/vm/drop_caches\"";
  };

  # see /hosts/defaults/default.nix for default shell options; can't set at user level
}
