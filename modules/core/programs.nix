{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs = {
    hyprland.enable = true;
    firefox.enable = true;
    adb.enable = true;
    nix-ld.enable = true;
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
