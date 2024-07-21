{ config, pkgs, lib, ... }:

{
  home.username = "poppy";
  home.homeDirectory = "/home/poppy";

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [{command = "discord";}];
      window.titlebar = false;

      output = {
        DP-1 = {
          mode = "2560x1440@164.987Hz";
          pos = "1920 0";
        };
        DP-3 = {
          disable = "";
        };
        HDMI-A-1 = {
          pos = "0 0";
        };
      };

      input = {
        "*" = {
          xkb_layout = "gb";
        };
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
          grimshot = pkgs.sway-contrib.grimshot;
          xdg-user-dir = "~/pictures";
        in lib.mkOptionDefault {
          ## Screenshot
          "Print" = "exec ${grimshot} --notify save screen ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # All visible outputs
          "Shift+Print" = "exec ${grimshot} --notify save area ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Manually select a region
          "Alt+Print" = "exec ${grimshot} --notify save active ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Currently active window
          "Shift+Alt+Print" = "exec ${grimshot} --notify save window ${xdg-user-dir}/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png')"; # Manually select a window
          "Ctrl+Print" = "exec ${grimshot} --notify copy screen";
          "Ctrl+Shift+Print" = "exec ${grimshot} --notify copy area";
          "Ctrl+Alt+Print" = "exec ${grimshot} --notify copy active";
          "Ctrl+Shift+Alt+Print" = "exec ${grimshot} --notify copy window";
          ## Screen recording
          #"${modifier}+Print" = "exec wayrecorder --notify screen";
          #"${modifier}+Shift+Print" = "exec wayrecorder --notify --input area";
          #"${modifier}+Alt+Print" = "exec wayrecorder --notify --input active";
          #"${modifier}+Shift+Alt+Print" = "exec wayrecorder --notify --input window";
          #"${modifier}+Ctrl+Print" = "exec wayrecorder --notify --clipboard --input screen";
          #"${modifier}+Ctrl+Shift+Print" = "exec wayrecorder --notify --clipboard --input area";
          #"${modifier}+Ctrl+Alt+Print" = "exec wayrecorder --notify --clipboard --input active";
          #"${modifier}+Ctrl+Shift+Alt+Print" = "exec wayrecorder --notify --clipboard --input window";
        };
    };
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Poppy -";
      userEmail = "me@poppyio.com";
    };

    bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        doas = "sudo";
        please = "sudo";
        nrb = "sudo nixos-rebuild switch";
      };
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-python.python
        ms-python.isort
        ms-python.debugpy
        ms-python.black-formatter
        ms-pyright.pyright
        yzhang.markdown-all-in-one
        wakatime.vscode-wakatime
        vscode-icons-team.vscode-icons
        vscjava.vscode-java-pack
        uloco.theme-bluloco-light
        # tuttieee.emacs-mcx
        tomoki1207.pdf
        timonwong.shellcheck
        tamasfe.even-better-toml
        shardulm94.trailing-spaces
        serayuzgur.crates
        seatonjiang.gitmoji-vscode
        scala-lang.scala
        njpwerner.autodocstring
        mattn.lisp
        mathiasfrohlich.kotlin
        kamadorueda.alejandra
      ];
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "nano";
      TERMINAL = "kitty";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      XDG_CONFIG_HOME = config.xdg.configHome;
      XDG_CACHE_HOME = config.xdg.cacheHome;
      XDG_DATA_HOME = config.xdg.dataHome;
      XDG_STATE_HOME = config.xdg.stateHome;
      NIXOS_OZONE_WL = "1";  # required by VSCode under wayland
      LD_LIBRARY_PATH = "/run/opengl-driver/lib:/run/opengl-driver-32/lib";  # should be done automatically but make explicit just in case
    };

    packages = with pkgs; [
      kitty
      wmenu
      discord
      clinfo
      wineWowPackages.waylandFull
      winetricks
      unrar
      lutris
      (retroarch.override {
        cores = with libretro; [
          beetle-saturn
        ];
      })
      xdelta
      p7zip
      adwaita-icon-theme  # for lutris
      ungoogled-chromium
      xivlauncher
      sway-contrib.grimshot  # screenshot tool
      #wayrecord  # screenrecord tool
    ];
  };

  systemd.user.startServices = true;

  home.stateVersion = "24.05";
}
