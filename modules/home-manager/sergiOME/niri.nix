{
  config,
  lib,
  ...
}: let
  cfg = config.sergiOME.niri;
in {
  options.sergiOME.niri = with lib; {
    enable = mkEnableOption "niri";
  };

  config = lib.mkIf cfg.enable {
    programs.fuzzel.enable = true;
    programs.swaylock.enable = true;

    services.mako.enable = true;

    programs.niri.settings = {
      input = {
        keyboard.xkb = {
          layout = "us,us";
          variant = ",intl";
          options = "grp:ctrl_space_toggle";
        };

        touchpad.dwt = true;
      };

      prefer-no-csd = true;

      window-rules = [
        {
          # wezterm bug workaround
          matches = [{app-id = "^org\.wezfurlong\.wezterm$";}];
          default-column-width = {};
        }
      ];

      spawn-at-startup = [
        {command = ["waybar"];}
        {command = ["mako"];}
      ];

      binds = with config.lib.niri.actions; {
        # help
        "Mod+Shift+Slash".action = show-hotkey-overlay;

        # quit and power off monitors
        "Mod+M".action = quit;
        "Mod+Shift+P".action = power-off-monitors;

        # audio keys
        "XF86AudioRaiseVolume".action =
          spawn "sh" "-c" "wpctl" "set-volume" "-l" "1.4" "@DEFAULT_AUDIO_SINK@"
          "0.1+";
        "XF86AudioLowerVolume".action =
          spawn "sh" "-c" "wpctl" "set-volume" "-l" "1.4" "@DEFAULT_AUDIO_SINK@"
          "0.1-";
        "XF86AudioMute".action =
          spawn "sh" "-c" "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioMicMute".action =
          spawn "sh" "-c" "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

        # start apps
        "Mod+Return".action = spawn "alacritty";
        "Mod+Space".action = spawn "fuzzel";
        "Mod+Alt+L".action = spawn "swaylock";
        "Mod+W".action = spawn "firefox";

        # screenshot
        "Mod+Shift+S".action = screenshot;
        "Mod+Shift+Space".action = screenshot-screen;
        "Mod+Shift+Return".action = screenshot-window;

        # navigation
        "Mod+Q".action = close-window;

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+J".action = focus-window-or-workspace-down;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
        "Mod+Shift+J".action = move-window-down-or-to-workspace-down;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Shift+Home".action = move-column-to-first;
        "Mod+Shift+End".action = move-column-to-last;

        "Mod+Ctrl+H".action = focus-monitor-left;
        "Mod+Ctrl+J".action = focus-monitor-down;
        "Mod+Ctrl+K".action = focus-monitor-up;
        "Mod+Ctrl+L".action = focus-monitor-right;

        "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Ctrl+1".action = move-column-to-workspace 1;
        "Mod+Ctrl+2".action = move-column-to-workspace 2;
        "Mod+Ctrl+3".action = move-column-to-workspace 3;
        "Mod+Ctrl+4".action = move-column-to-workspace 4;
        "Mod+Ctrl+5".action = move-column-to-workspace 5;
        "Mod+Ctrl+6".action = move-column-to-workspace 6;
        "Mod+Ctrl+7".action = move-column-to-workspace 7;
        "Mod+Ctrl+8".action = move-column-to-workspace 8;
        "Mod+Ctrl+9".action = move-column-to-workspace 9;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+C".action = center-column;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";
      };
    };
  };
}
