{ config, lib, ... }:
let
  cfg = config.sergiOME.waybar;
in
{
  options.sergiOME.waybar = with lib; {
    enable = mkEnableOption "waybar";
  };

  config.programs.waybar = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      bar = {
        layer = "top";
        modules-left = ["custom/launcher" "cpu" "memory" /* "custom/media" */ "tray"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["backlight" "pulseaudio" "clock" "battery" "custom/power"];

        "pulseaudio" = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "󰝟 ";
          format-icons = {
            default = ["" " " " "];
          };
        };

        "backlight" = {
          tooltip = false;
          format = " {}%";
          interval = 1;
        };

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [" " " " " " " " " "];
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };

        "clock" = {
          format = "{:  %I:%M %p    %d/%m/%Y}";
        };

        "cpu" = {
          interval = 15;
          format = "  {}%";
          max-length = 10;
        };

        "memory" = {
          interval = 30;
          format = "  {}%";
          max-length = 10;
        };

# "custom/media" = {
#   interval = 30;
#   format = "{icon} {}";
#   return-type = "json";
#   max-length = 20;
#   format-icons = {
#     "spotify": " ";
#     "default": " ";
#   };
#   escape = true;
#   exec = "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null";
#   on-click = "playerctl play-pause";
# };

        "custom/launcher" = {
          format = " ";
        };

        "custom/power" = {
          format = " ";
          on-click = "bash ~/.config/rofi/leave/leave.sh";
        };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
