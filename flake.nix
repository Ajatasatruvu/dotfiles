{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      host = "nixVictus";
      username = "harsha";
      stateVersion = "25.05";
      gitUsername = "pharshavardhan2";
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system inputs username host stateVersion gitUsername;
          };
          modules = [
            ./hosts/${host}
          ];
        };
      };
    };
}
