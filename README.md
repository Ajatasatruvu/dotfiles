- use `adb push <PcFilePath> <AndroidPath>` or `adb pull <AndroidPath> <Pcpath>` to copy files
# TEMPLATES
- Add dev environment template to templates folder
- `nix registry add <id or name for templates> <absolute path to templates dir>` to add templates to registry
- `nix flake init -t <id given above>#<template name given in flake.nix of templates folder` in a directory to copy template to that dir 
- `nix develop` to make dev shell environment
# KEYBINDS
- `=>` indicates followed by
## HYPRLAND
- `SUPER + b` browser
- `SUPER + ENTER` terminal
- `SUPER + o` okular
- `SUPER + l` lock screen
- `ALT + F4` kill active window
- `SUPER + m` exit hyprland
- `ALT + TAB` cycle windows
- `SUPER + ← / → / ↑ / ↓` move focus to window on left/right/down/up
- `SUPER + 1 / 2 / 3 / 4` switch to workspace 1 / 2 / 3 / 4
- `SUPER + SHIFT + 1 / 2 / 3 / 4` move window to workspace 1 / 2 / 3 / 4
- `SUPER + SHIFT + ← / → / ↑ / ↓` resize window
## WEZTERM
- `CTRL + a` leader
- `LEADER => -` split vertical
- `LEADER => =` split horizontal
- `LEADER => 0` select pane to swap with active
- `LEADER => SPACE` rotate panes clockwise
- `LEADER => h / l / j / k` move focus to left/right/down/up
- `CTRL + SHIFT + ← / → / ↑ / ↓` adjust pane size

# TODO
- [x] bar
- [ ] login manager
