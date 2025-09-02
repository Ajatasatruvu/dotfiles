{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = {
      "mount.yazi" = pkgs.yaziPlugins.mount; # needs udisks and lsblk
    };
    settings = {
      keymap = {
        mgr = {
          prepend_keymap = [
            {
              on = "M";
              run = "plugin mount";
            }
          ];
        };
      };
    };
  };
}
