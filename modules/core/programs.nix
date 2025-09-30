{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    adb.enable = true;
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
