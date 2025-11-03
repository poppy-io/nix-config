{lib, ...}: {
  services.flatpak = {
    enable = true;

    remotes = lib.mkOptionDefault [{
      name = "launcher.moe";
      location = "https://gol.launcher.moe/gol.launcher.moe.flatpakrepo";
    }];

    update.auto.enable = false;
    uninstallUnmanaged = true;

    packages = [
      "com.protonvpn.www"
    ];
  };
}
