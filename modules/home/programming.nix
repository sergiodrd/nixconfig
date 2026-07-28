{ inputs, self, ... }: {
  flake.homeManagerModules.programming = {
    config,
    lib,
    pkgs,
    ...
  }: let
    unst = import inputs.nixpkgs-unstable {
      system = "x86_64-linux";
    };
  in {
    config = {
      home.packages = with pkgs; [
        unst.gleam
        erlang_27
        rebar3
        inotify-tools
        fly
        racket
        nodejs
        deno
        aoc-cli
        claude-code
        zap
        tor
        proxychains
      ];
    };
  };
}
