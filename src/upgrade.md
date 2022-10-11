# Upgrading topgrade

The precompiled binaries supplied in the Github releases page are compiled with a self upgrade feature. Topgrade will try to upgrade itself before attempting anything else and will respawn itself when an update is downloaded. If you choose to install Topgrade in this method it is recommended that you place the binary in some place which is writable by your user account, such as `~/.local/bin`.

If you prefer to have Topgrade installed in system-wide manner then it's recommended to either install it using the OS package manager or `cargo install`. Topgrade will not have the self upgrade feature but it will keep itself up to date by calling the operating system's package manager.

Due to a limitation in deleting used files in Windows, you must place the Topgrade executable in the same drive as your `%TEMP%` directory.
