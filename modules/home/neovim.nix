{ inputs, self, ... }: {
  flake.homeManagerModules.neovim = import ./_neovim/default.nix { inherit inputs; };
}
