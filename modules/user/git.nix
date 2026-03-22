{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Poppy -";
      user.email = "me@poppyio.com";
    };
    
    signing.format = null; # new default: legacy is "openpgp"
  };
}
