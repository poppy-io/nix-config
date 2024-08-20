{...}: {
  imports = [
    ./de.nix
    ./zh.nix
    ./ja.nix
    ./ko.nix
  ];

  i18n = {
    defaultLocale = "en_GB.UTF-8/UTF-8";
    inputMethod.enable = true;
    inputMethod.type = "ibus";
  };

  environment.variables.GLFW_IM_MODULE = "ibus";

  # use equivalent BAC timezone due to lack of Scottish option
  time.timeZone = "Europe/Dublin";
}
