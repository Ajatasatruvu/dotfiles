{
  programs.joplin-desktop = {
    enable = true;
    sync = {
      interval = "1h";
      target = "onedrive";
    };
  };
}
