{ pkgs, ... }:
pkgs.vimUtils.buildVimPluginFrom2Nix {
  name = "indent-rainbowline";
  src = pkgs.fetchFromGitHub {
    owner = "TheGLander";
    repo = "indent-rainbowline.nvim";
    rev = "7df1101d80f75ee97d11b6e136a6d1c9a876b92a";
    hash = "sha256-qt/LfnVlZc36ZRKqp56I0CxAL+hwC7vNitiCp48Fjuk=";
  };
}
