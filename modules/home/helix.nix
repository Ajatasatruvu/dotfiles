{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixpkgs-fmt
    ];
    settings = {
      theme = "flexoki_dark";
      editor = {
        line-number = "relative";
        true-color = true;
        statusline = {
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "total-line-numbers"
            "file-encoding"
          ];
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        whitespace = {
          render = {
            tab = "all";
            nbsp = "all";
            nnbsp = "all";
            # newline = "all";
          };
          characters = {
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
          };
          auto-format = true;
        }
      ];
    };
  };
}
