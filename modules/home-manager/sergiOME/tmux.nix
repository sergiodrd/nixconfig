{ config, lib, pkgs, ... }:
let
  cfg = config.sergiOME.tmux;
in
{
  options.sergiOME.tmux = with lib; {
    enable = mkEnableOption "tmux";
  };

  config.programs.tmux = lib.mkIf cfg.enable {
    enable = true;
    baseIndex = 1;
    historyLimit = 10000;
    mouse = true;
    prefix = "C-a";
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

    '';
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
        '';
      }
      {
        plugin = catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'frappe'";
      }
      # {
      #   plugin = vim-tmux-navigator;
      # }
    ];
  };
}
