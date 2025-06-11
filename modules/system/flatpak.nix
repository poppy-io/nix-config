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
      { appId = "moe.launcher.the-honkers-railway-launcher"; origin = "launcher.moe"; }
      { appId = "moe.launcher.sleepy-launcher"; origin = "launcher.moe"; }
      "org.gnome.Platform//45"
    ];
  };
}
