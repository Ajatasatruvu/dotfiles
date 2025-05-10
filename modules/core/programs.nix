{ pkgs, ... }:
{
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    yazi.enable = true;
  };
  environment.systemPackages = with pkgs; [
    brightnessctl
    eza
    git
    playerctl
  ];
}
