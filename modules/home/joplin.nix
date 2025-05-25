{
  programs.joplin-desktop = {
    enable = true;
    extraConfig = {
      "markdown.plugin.sub" = true;
      "markdown.plugin.sup" = true;
      "markdown.plugin.emoji" = true;
    };
    general.editor = "hx";
    sync = {
      interval = "1h";
      target = "onedrive";
    };
  };
}
