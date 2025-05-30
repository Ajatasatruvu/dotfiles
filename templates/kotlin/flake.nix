{
  description = "kotlin development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        pkgs.mkShell {
          name = "kotlin devEnv";
          packages = with pkgs; [
            kotlin-language-server
            kotlin
            ktfmt
          ];
          shellHook = ''
            exec zsh
          '';
        };
    };
}
