{...}: {
  xdg.configFile."miracle-wm.yaml".text = builtins.toJSON {
    action_key = "meta";
    terminal = "kitty";
  };

  xdg.configFile."miracle-wm.config".text = "display-config=sidebyside";
}
