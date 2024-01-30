# Upgrading topgrade

The precompiled binaries supplied in the Github releases page are compiled with a self upgrade feature. Topgrade will try to upgrade itself before attempting anything else and will respawn itself when an update is downloaded. If you choose to install Topgrade in this method it is recommended that you place the binary in some place which is writable by your user account, such as `~/.local/bin` or `%APPDATA%`.

If you prefer to have Topgrade installed in system-wide manner then it's recommended to using OS package manager or `cargo install`.
