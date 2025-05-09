{ pkgs, inputs, ... }:
{
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
  };
  environment.systemPackages = with pkgs; [
    brightnessctl
    git
  ];
}
