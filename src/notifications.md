# Notifications

Topgrades sends a desktop notification when a step has been failed. Desktop notifications works by default in macOS. On Linux, [notify-send](https://ss64.com/bash/notify-send.html) has to be installed in order for them to work.

Desktop notifications in other platforms is not supported at the moment.

If the configuration variable notify_each_step is set to true, Topgrade will send a desktop notification at the beginning of each step.
