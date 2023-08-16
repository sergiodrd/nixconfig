{ pkgs, ... }:
{
  enable = true;
  baseIndex = 1;
  historyLimit = 10000;
  mouse = true;
  prefix = "C-a";
  terminal = "tmux-256color";
  extraConfig = ''
    bind C-a send-prefix
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
    
    # --> Catppuccin (Macchiato)
    thm_bg="#24273a"
    thm_fg="#cad3f5"
    thm_cyan="#91d7e3"
    thm_black="#1e2030"
    thm_gray="#363a4f"
    thm_magenta="#c6a0f6"
    thm_pink="#f5bde6"
    thm_red="#ed8796"
    thm_green="#a6da95"
    thm_yellow="#eed49f"
    thm_blue="#8aadf4"
    thm_orange="#f5a97f"
    thm_black4="#5b6078"
    
    set -g status-style bg=$thm_magenta,fg=$thm_bg
    
    # Widgets
    prfx="#{?client_prefix,<prefix>,}"
    time="%I:%M %p"
    date="%d-%b-%Y"
    set -g status-right "''${prfx} ''${time} ''${date} "
  '';
  plugins = with pkgs; [
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    }
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-boot 'on'
      '';
    }
  ];
}
