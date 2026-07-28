{ inputs, self, ... }: {
  flake.homeManagerModules.tools = {
    config,
    lib,
    pkgs,
    ...
  }: {
    options.sergiOME.tools = with lib; {
      swappy.enable = mkEnableOption "swappy config";
      typst.enable = mkEnableOption "typst";
    };

    config = {
      home.file.".config/swappy/config" = lib.mkIf config.sergiOME.tools.swappy.enable {
        text = ''
          [Default]
          save_dir=$HOME/screenshots
          early_exit=true
        '';
      };

      home.packages = lib.optional config.sergiOME.tools.typst.enable pkgs.typst;
    };
  };
}
