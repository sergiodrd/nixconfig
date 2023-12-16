{ config, lib, ... }:
let
  cfg = config.sergiOS.docker;
in
{
  options.sergiOS.docker = with lib; {
    enable = mkEnableOption "docker";
    rootless = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      rootless = lib.mkIf cfg.rootless {
        enable = true;
        setSocketVariable = true;
      };
      enable = !cfg.rootless;
    };
    users.users.${config.sergiOS.user} = lib.mkIf (!cfg.rootless) {
      extraGroups = [ "docker" ];
    };
  };
}
