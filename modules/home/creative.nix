{ inputs, self, ... }: {
  flake.homeManagerModules.creative = {
    config,
    lib,
    pkgs,
    ...
  }: {
    options.sergiOME.creative = with lib; {
      gimp.enable = mkEnableOption "gimp";
      krita.enable = mkEnableOption "krita";
      davinci-resolve.enable = mkEnableOption "davinci-resolve";
    };

    config = {
      home.packages = with pkgs;
        (lib.optional config.sergiOME.creative.gimp.enable gimp)
        ++ (lib.optional config.sergiOME.creative.krita.enable krita)
        ++ (lib.optional config.sergiOME.creative.davinci-resolve.enable davinci-resolve);
    };
  };
}
