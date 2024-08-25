{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.sergiOME.programming;
  unst = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
  };
in
{
  options.sergiOME.programming = with lib; {
    enable = mkEnableOption "programming";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      unst.gleam
      erlang
      rebar3
      inotify-tools
      fly
      racket
      nodejs
      deno
    ];
  };
}
