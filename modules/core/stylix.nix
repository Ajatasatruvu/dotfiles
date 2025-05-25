{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = with pkgs; {
    enable = true;
    # schemes at tinted-theming.github.io/tinted-gallery
    base16Scheme = "${base16-schemes}/share/themes/onedark-dark.yaml";
    # desktop wallpaper
    image = ../../wallpapers/cthulhu-1920x1080.png;
    cursor = {
      package = bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      sansSerif = {
        package = nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      serif = {
        package = nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      monospace = {
        package = nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
  };
}
