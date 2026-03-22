{
  programs.git = {
    enable = true;    
    signing.format = null; # new default: legacy is "openpgp"

    settings = {
      user = {
        name = "poppy -";
        email = "me@poppyio.com";
      };
    };
  };
}
