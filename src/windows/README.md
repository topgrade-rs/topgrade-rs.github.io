# Windows

* [Scoop](https://scoop.sh/#/apps?q=topgrade)
* [Winget](https://winstall.app/apps/topgrade-rs.topgrade)

## Usage

Just run `topgrade`.

## Configuration

See `config.example.toml` for an example configuration file.

### Configuration Path

`%APPDATA%`

`topgrade` will look for the configuration file in the following places, in order of priority:

1. `CONFIG_DIR/topgrade.toml`
2. `CONFIG_DIR/topgrade/topgrade.toml`

If the file with higher priority is present, no matter it is valid or not, the other configuration files will be ignored.

On the first run(no configuration file exists), `topgrade` will create a configuration file at `CONFIG_DIR/topgrade.toml` for you.

## FAQ

It is important to note that Topgrade may be unable to upgrade certain applications used for launching it, including third-party terminals like cmder.

We suggest either creating a shortcut for 'topgrade--keep' or running Topgrade via your preferred shell.

Please note that if installed via **scoop**, Topgrade may fail to upgrade itself unless `self_rename = true` is set in **topgrade.toml**.
