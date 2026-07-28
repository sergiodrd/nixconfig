{ ... }: {
  flake.homeManagerModules.core = { lib, ... }: {
    options.sergiOME = with lib; {
      username = mkOption {
        type = types.str;
        default = "sergio";
      };
      homeDirectory = mkOption {
        type = types.str;
        default = "/home/sergio";
      };
    };

    config = {
      programs.home-manager.enable = true;
      gtk.gtk4.theme = null;
    };
  };
}
