# nixconfig

NixOS and home-manager configuration for 6 machines:

| Host | Type | Notes |
|------|------|-------|
| `framework` | Personal laptop | On-the-go Puter |
| `spectre` | Personal laptop | On-the-go Puter (Old) |
| `legion` | Personal laptop | At-home Puter |
| `pi` | Raspberry Pi 4 | aarch64-linux |
| `thinkpad` | ThinkPad | Work in progress |
| `racknerd0` | VPS | Headless, public-facing |

## Structure

Built with [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/vic/import-tree).

```
modules/
├── hosts/          # Per-host NixOS configurations
├── nixos/          # NixOS feature modules (sergiOS.* options)
└── home/           # Home-manager modules (sergiOME.* options)
```

Files and directories prefixed with `_` are ignored by import-tree: used for hardware configs, home.nix files, and neovim internals that aren't flake-parts modules.

### NixOS modules (`modules/nixos/`)

Each file exposes one `flake.nixosModules.<name>`. Hosts import the ones they need.

### Home-manager modules (`modules/home/`)

Each file exposes one `flake.homeManagerModules.<name>`. Hosts list the modules they want in `sharedModules`. Sub-options control features within a module.

### Secrets

Managed with [sops-nix](https://github.com/Mic92/sops-nix). Secrets are in `secrets.yaml`, encrypted with age keys.
