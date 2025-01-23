{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.sergiOME.alacritty;
in {
  options.sergiOME.alacritty = with lib; {
    enable = mkEnableOption "alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
    programs.foot.enable = true;
    programs.wezterm.enable = true;
    programs.kitty.enable = true;
    # home.file."alacritty.toml" = {
    #   source = config.lib.file.mkOutOfStoreSymlink
    #   /home/sergio/nixconfig/modules/home-manager/sergiOME/alacritty/alacritty.toml;
    #   target = ".config/alacritty/alacritty.toml";
    # };
    # home.packages = with pkgs; [
    #   (nerdfonts.override { fonts = [ "Iosevka" "IBMPlexMono" ]; })
    # ];
  };
}
