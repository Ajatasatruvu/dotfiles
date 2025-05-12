{
  services = {
    blueman.enable = true; #bluetooth
    #audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true; # manage disks and mount
  };
}
