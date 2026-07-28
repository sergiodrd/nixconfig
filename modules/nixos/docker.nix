{ inputs, self, ... }: {
  flake.nixosModules.docker = {
    config,
    lib,
    ...
  }: let
    cfg = config.sergiOS.docker;
  in {
    options.sergiOS.docker = with lib; {
      rootless = mkOption {
        type = types.bool;
        default = true;
      };
    };

    config = {
      virtualisation.docker = {
        rootless = lib.mkIf cfg.rootless {
          enable = true;
          setSocketVariable = true;
        };
        enable = !cfg.rootless;
      };
      users.users.${config.sergiOS.user} = lib.mkIf (!cfg.rootless) {
        extraGroups = ["docker"];
      };
    };
  };
}
