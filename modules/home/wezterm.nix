{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action
      local config = wezterm.config_builder()
      config.color_scheme = 'flexoki-dark'
      config.hide_tab_bar_if_only_one_tab = true

      config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
      config.keys = {
        {
          mods = 'LEADER',
          key = '-',
          action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
          mods = 'LEADER',
          key = '=',
          action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },
        {
          mods = 'LEADER',
          key = 'Space',
          action = act.RotatePanes 'Clockwise'
        },
        {
          mods = 'LEADER',
          key = '0',
          action = act.PaneSelect {
            mode = 'SwapWithActive'
          }
        },
        {
          mods = 'LEADER',
          key = 'h',
          action = act.ActivatePaneDirection 'Left'
        },
        {
          mods = 'LEADER',
          key = 'l',
          action = act.ActivatePaneDirection 'Right'
        },
        {
          mods = 'LEADER',
          key = 'j',
          action = act.ActivatePaneDirection 'Down'
        },
        {
          mods = 'LEADER',
          key = 'k',
          action = act.ActivatePaneDirection 'Up'
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'LeftArrow',
          action = act.AdjustPaneSize { 'Left', 5 }
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'RightArrow',
          action = act.AdjustPaneSize { 'Right', 5 }
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'DownArrow',
          action = act.AdjustPaneSize { 'Down', 5 }
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'UpArrow',
          action = act.AdjustPaneSize { 'Up', 5 }
        },
      }
      return config
    '';
  };
}
