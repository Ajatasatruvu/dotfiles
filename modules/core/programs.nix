{ pkgs, ... }:
{
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
  };
  environment.systemPackages = with pkgs; [
    brightnessctl
    eza
    git
    kdePackages.okular
    playerctl
    wl-gammarelay-rs
  ];
}
