{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      "$mod" = "SUPER";
      "$terminal" = "wezterm";
      "$browser" = "firefox";
      monitor = [
        "eDP-1, 1920x1080, 1920x0, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
      ];
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      bind = [
        "$mod, B, exec, $browser"
        "$mod, Return, exec, $terminal"
        "ALT, F4, killactive"
        "$mod, M, exit"
        "ALT, TAB, cyclenext"
        "ALT, TAB, bringactivetotop"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];
      binde = [
        "$mod SHIFT, left, resizeactive, -50 0"
        "$mod SHIFT, right, resizeactive, 50 0"
        "$mod SHIFT, up, resizeactive, 0 -50"
        "$mod SHIFT, down, resizeactive, 0 50"
      ];
    };
  };
}
