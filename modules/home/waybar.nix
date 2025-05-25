{ config, ... }:
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
            "Joplin" = "󱓧 ";
            "class<.*idea.*" = " ";
          };
        };
        "clock" = {
          format = "{:%H:%M}";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "hyprland/window" = {
          separate-outputs = true;
          icon = true;
          max-length = 30;
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
    style = ''
      * {
        font-family: ${config.stylix.fonts.monospace.name};
        font-size: 18px; 
        border: none;
        border-radius: 0;
        min-height: 0;
      }
      window#waybar {
        background: rgba(0, 0, 0, 0);
      }
      #workspaces {
        color: #${config.lib.stylix.colors.base00};
        background: #${config.lib.stylix.colors.base01};
        margin: 4px 4px;
        padding: 5px 5px;
        border-radius: 16px;
      }
      #workspaces button {
        font-weight: bold;
        padding: 0px 5px;
        margin: 0px 3px;
        border-radius: 16px;
        color: #${config.lib.stylix.colors.base00};
        background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
        opacity: 0.5;
      }
      #workspaces button.active {
        opacity: 1.0;
      }
      #workspaces button:hover {
        opacity: 0.8;
      }
      tooltip {
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base08};
        border-radius: 12px;
      }
      tooltip label {
        color: #${config.lib.stylix.colors.base08};
      }
      #window, #pulseaudio, #cpu, #memory {
        margin: 4px 0px;
        margin-left: 7px;
        padding: 0px 12px;
        border-radius: 8px;
        background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base09}, #${config.lib.stylix.colors.base0A});
        color: #${config.lib.stylix.colors.base00};
      }
      #window {
        font-size: 10px;
      }
      #pulseaudio.muted {
        background: linear-gradient(45deg, #${config.lib.stylix.colors.base0B}, #${config.lib.stylix.colors.base0C}, #${config.lib.stylix.colors.base0D});
      }
      #battery, #tray, #custom-night-light, #bluetooth, #power-profiles-daemon {
        font-size: 20px;
        margin: 4px 0px;
        margin-right: 7px;
        border-radius: 8px;
        padding: 0px 12px;
        color: #${config.lib.stylix.colors.base00};
        background: linear-gradient(45deg, #${config.lib.stylix.colors.base0B}, #${config.lib.stylix.colors.base0C}, #${config.lib.stylix.colors.base0D});
      }
      #battery.charging {
        background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base09}, #${config.lib.stylix.colors.base0A});
      }
      #clock {
        font-weight: bold;
        font-size: 16px;
        color: #${config.lib.stylix.colors.base00};
        background: linear-gradient(90deg, #${config.lib.stylix.colors.base0E}, #${config.lib.stylix.colors.base0F});
        margin: 0px 0px 4px 0px;
        padding: 0px 5px;
        border-radius: 16px;
      }
    '';
  };
}

