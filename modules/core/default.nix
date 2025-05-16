{ inputs, ... }:
{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./system.nix
    ./user.nix
    ./yazi.nix
  ];
}
  
