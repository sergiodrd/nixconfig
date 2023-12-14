{
  default = { config, lib, ... }: {
    home = rec {
      username = lib.mkDefault "sergio";
      homeDirectory = lib.mkDefault "/home/${username}";
    };
  };

  sergiOME = import ./sergiOME;
}
