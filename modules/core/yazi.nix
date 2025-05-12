{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = {
      "mount.yazi" = pkgs.yaziPlugins.mount; # needs udisks and lsblk
    };
    settings = {
      keymap = {
        manager = {
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
