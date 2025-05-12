{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [
          "hyprland/window"
          "pulseaudio"
          "cpu"
          "memory"
        ];
        modules-right = [
          "custom/night-light"
          "bluetooth"
          "power-profiles-daemon"
          "battery"
          "tray"
          "clock"
        ];
        "hyprland/workspaces" = {
          format = "{windows}";
          window-rewrite = {
            "class<.*firefox.*>" = " ";
            "class<.*firefox.*> title<.*github.*>" = " ";
            "class<.*firefox.*> title<.*youtube.*>" = " ";
            "wezterm" = " ";
            "okular" = " ";
          };
        };
        "clock" = {
          format = "{:%H:%M}";
          tooltip = true;
          tooltip-format = "{:%d-%m-%Y}";
        };
        "hyprland/window" = {
          separate-outputs = true;
          icon = true;
        };
        "memory" = {
          format = " {}%";
        };
        "cpu" = {
          interval = 5;
          format = " {usage}%";
          tooltip = true;
        };
        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
        };
        "tray" = {
          spacing = 12;
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = "true";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
        "bluetooth" = {
          format = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
          "format-device-preference" = [ "device1" "device2" ];
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };
        "custom/night-light" = {
          "format" = " {}";
          "tooltip-format" = "scroll to adjust night light";
          "exec" = "wl-gammarelay-rs watch {t}";
          "on-scroll-up" = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100";
          "on-scroll-down" = "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100";
        };
        "power-profiles-daemon" = {
          "format" = "{icon}";
          "tooltip-format" = "Power profile: {profile}\nDriver = {driver}";
          "tooltip" = true;
          "format-icons" = {
            "default" = " ";
            "performance" = " ";
            "balanced" = " ";
            "power-saver" = " ";
          };
        };
      }
    ];
  };
}

