# nixconfig

NixOS and home-manager configuration for 5 machines:

| Host | Type | Notes |
|------|------|-------|
| `legion` | Personal laptop | At-home workstation |
| `spectre` | Personal laptop | On-the-go |
| `pi` | Raspberry Pi 4 | aarch64-linux |
| `thinkpad` | ThinkPad | Work in progress |
| `racknerd0` | VPS | Headless, public-facing |

## Structure

Built with [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/vic/import-tree). The flake entry point is four lines; everything else lives under `modules/`, which import-tree loads automatically.

```
modules/
├── hosts/          # Per-host NixOS configurations
├── nixos/          # NixOS feature modules (sergiOS.* options)
└── home/           # Home-manager modules (sergiOME.* options)
```

Files and directories prefixed with `_` are ignored by import-tree — used for hardware configs, home.nix files, and neovim internals that aren't flake-parts modules.

### NixOS modules (`modules/nixos/`)

Each file exposes one `flake.nixosModules.<name>`. Hosts import the ones they need. There are no top-level enable options — importing a module is how you enable it.

### Home-manager modules (`modules/home/`)

Same pattern: each file exposes one `flake.homeManagerModules.<name>`. Hosts list the modules they want in `sharedModules`. Sub-options like `sergiOME.browsing.firefox.enable` control features within a module.

### Secrets

Managed with [sops-nix](https://github.com/Mic92/sops-nix). Secrets are in `secrets.yaml`, encrypted with age keys.

