# DragonFly and Free BSD

## Instalation

Either use `cargo install` or the compiled binaries from the release page.
The compiled binaries contain a self-upgrading feature.

> Currently, Topgrade requires Rust 1.65 or above. In general, Topgrade tracks
> the latest stable toolchain.

## Usage

Just run `topgrade`.

## Configuration

See `config.example.toml` for an example configuration file.

### Configuration Path

`${XDG_CONFIG_HOME:-~/.config}`

`topgrade` will look for the configuration file in the following places, in order of priority:

1. `CONFIG_DIR/topgrade.toml`
2. `CONFIG_DIR/topgrade/topgrade.toml`

If the file with higher priority is present, no matter it is valid or not, the other configuration files will be ignored.

On the first run(no configuration file exists), `topgrade` will create a configuration file at `CONFIG_DIR/topgrade.toml` for you.
