{ stateVersion, ... }:
{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ "https://hyprland.cachix.org" "https://devenv.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" ];
    };
  };
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  console.keyMap = "us";
  environment.pathsToLink = [ "/share/zsh" ];
  system.stateVersion = stateVersion;
}
