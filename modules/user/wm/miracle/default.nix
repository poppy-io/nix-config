{
  # will require this line in syspkgs to function
  # programs.wayland.miracle-wm.enable = true;

  xdg.configFile."miracle-wm.yaml".text = builtins.toJSON {
    action_key = "meta";
    terminal = "kitty";
  };

  xdg.configFile."miracle-wm.config".text = "display-config=sidebyside";
}
