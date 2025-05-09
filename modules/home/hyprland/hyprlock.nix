{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 10;
      };
      background = [
        {
          path = "${config.stylix.image}";
        }
      ];
      input-field = with config.lib.stylix.colors; [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 2;
          dots_size = 0.1;
          dots_spacing = 0.3;
          outer_color = "rgb(${base03})";
          inner_color = "rgb(${base00})";
          font_color = "rgb(${base05})";
          fail_color = "rgb(${base08})";
          check_color = "rgb(${base0A})";
          position = "0, 20";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
