{ config, lib, ... }:
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
      exec-once = [
        "hypridle"
        "waybar"
      ];
      general = with config.lib.stylix.colors; {
        gaps_in = 0;
        gaps_out = 0;
        resize_on_border = true;
        # override color set by stylix
        "col.active_border" = lib.mkForce "rgb(${base0D}) rgb(${base0C}) rgb(${base0B}) rgb(${base0A}) rgb(${base09}) rgb(${base08}) 360deg";
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
      windowrulev2 = [
        "float, class:(clipse)"
        "size 70% 60%, class:(clipse)"
      ];
      bind = [
        "$mod, B, exec, $browser"
        "$mod, Return, exec, $terminal"
        "$mod, O, exec, okular"
        "$mod, J, exec, joplin-desktop"
        "$mod, S, exec, steam"
        "$mod, I, exec, idea-community"
        "$mod, C, exec, $terminal -e --class clipse clipse"
        "$mod, L, exec, playerctl pause; loginctl lock-session"
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
      # l extension makes bind work even when locked
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      # e extension makes bind repeat action when held
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ];
    };
  };
}
