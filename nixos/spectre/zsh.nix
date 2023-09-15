{ pkgs, ... }:
{
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  autocd = true;
  dotDir = ".config/zsh";
  historySubstringSearch.enable = true;
  syntaxHighlighting.enable = true;

  # envExtra = '' # .zshenv
  # '';

  initExtra = '' # .zshrc (see other options for different positioning in .zshrc)
    source ~/.config/zsh/.p10k.zsh
  '';

  shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /home/sergio/nixconfig#spectre --show-trace";
  };

  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
  ];
}
