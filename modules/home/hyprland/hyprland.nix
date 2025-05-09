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
      general = {
        gaps_in = 0;
        gaps_out = 0;
        resize_on_border = true;
      };
      decoration = {
        rounding = 10;
        inactive_opacity = 0.8;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      cursor = {
        inactive_timeout = 10;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      bind = [
        "$mod, B, exec, $browser"
        "$mod, Return, exec, $terminal"
        "$mod, F, exec, $fileManager"
        "$mod, O, exec, okular"
        "ALT, F4, killactive"
        "$mod, M, exit"
        "ALT, TAB, cyclenext"
        "ALT, TAB, bringactivetotop"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList
          (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
      # resize windows
      binde = [
        "$mod SHIFT, left, resizeactive, -50 0"
        "$mod SHIFT, right, resizeactive, 50 0"
        "$mod SHIFT, up, resizeactive, 0 -50"
        "$mod SHIFT, down, resizeactive, 0 50"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };
}
