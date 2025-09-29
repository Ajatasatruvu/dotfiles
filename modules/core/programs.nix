{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    adb.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ thunar-volman ];
    };
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
