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
    jmtpfs
    kdePackages.okular
    playerctl
    wl-gammarelay-rs
  ];
}
