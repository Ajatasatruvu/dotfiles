{ inputs, pkgs, username, stateVersion, gitUsername, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${username} = {
      imports = [ ../home ];
      home = {
        username = username;
        homeDirectory = "/home/${username}";
        preferXdgDirectories = true;
        stateVersion = stateVersion;
      };
      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
        };
      };
      programs.home-manager.enable = true;
    };
  };
  users.users.${username} = {
    isNormalUser = true;
    description = gitUsername;
    extraGroups = [
      "adbusers"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
