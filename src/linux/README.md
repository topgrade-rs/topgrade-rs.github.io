# GNU/Linux

## Installation

- Arch Linux: [AUR](https://aur.archlinux.org/packages/topgrade)
- NixOS: [Nixpkgs](https://search.nixos.org/packages?show=topgrade)
- Void Linux: [XBPS](https://voidlinux.org/packages/?arch=x86_64&q=topgrade)

Other systems users can either use `cargo install` or the compiled binaries from the release page.
The compiled binaries contain a self-upgrading feature.

> Currently, Topgrade requires Rust 1.65 or above. In general, Topgrade tracks
> the latest stable toolchain.

## Usage

Just run `topgrade`.

## Configuration

See `config.example.toml` for an example configuration file.

### Configuration Path

`${XDG_CONFIG_HOME:-~/.config}`

1. `CONFIG_DIR/topgrade.toml`
2. `CONFIG_DIR/topgrade/topgrade.toml`

If the file with higher priority is present, no matter it is valid or not, the other configuration files will be ignored.

On the first run(no configuration file exists), `topgrade` will create a configuration file at `CONFIG_DIR/topgrade.toml` for you.
