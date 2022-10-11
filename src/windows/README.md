# Windows

Windows is fully supported by Topgrade. You can either install it from Scoop or use the binary in the release page.

One thing to note is that Topgrade will fail to upgrade any application used for launching it, such as 3rd party terminals like cmder.

My personal recommendation is to create a shortcut for `topgrade --keep` and set this shortcut to always run as administrator, then invoke Topgrade by doubling clicking the shortcut. This will make sure Topgrade always runs with administrative privileges by Windows' built in terminal

Note that Togprade will probably fail to upgrade itself if installed using `scoop`
