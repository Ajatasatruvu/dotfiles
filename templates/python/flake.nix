{
  description = "python development environment";

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
          name = "python devEnv";
          packages = with pkgs; [
            basedpyright
            (python3.withPackages (pp: [ pp.ruff ]))
          ];
          shellHook = ''
            echo `${pkgs.python3}/bin/python --version`
            exec zsh
          '';
        };
    };
}
