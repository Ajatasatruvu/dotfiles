{ pkgs, ... }:
{
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    fuse.userAllowOther = true;
  };
  environment.systemPackages = with pkgs; [
    brightnessctl
    eza
    git
    simple-mtpfs
    kdePackages.okular
    playerctl
    wl-gammarelay-rs
  ];
}
