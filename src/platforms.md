# Supported platforms 

Topgrade should probably work on whichever platform it can be build. The real question is whether Topgrade knows that platform and can utilize its unique features, such as the operating system's package manager. Topgrade is tested on and knows the following platforms:

- Linux
  - Arch based
  - Red Hat based
  - Debian based
  - Clear Linux
  - Gentoo
  - NixOS
  - openSUSE
  - Void
- DragonFly BSD
- FreeBSD
- macOS
- Windows

Depending on the platform, available software and the configuration file, topgrade runs upgrades for any of the following (multiple sections can apply at once):

## Remote execution

If `remote_topgrade` option is specified, Topgrade will first connect through SSH to the specified hosts
and run an already installed `topgrade` executable (either `topgrade` or the executable specified by the `remote_topgrade_path` option).

## Windows

If ran on Windows, Topgrade will execute the following steps (when the relevant software is installed):

- Run an already installed `topgrade` executable in all installed [WSL](https://learn.microsoft.com/en-us/windows/wsl/about) distributions
  - **Note:** This is automatically skipped for any distribution that doesn't already have `topgrade` in `PATH`
- Update [WSL](https://learn.microsoft.com/en-us/windows/wsl/basic-commands#update-wsl) (`wsl --update`)
- Upgrade installed [Chocolatey](https://chocolatey.org) packages (`choco upgrade all`)
- Update [Scoop](https://scoop.sh) (`scoop update`)
- Update installed [Scoop](https://scoop.sh) packages for the current user (`scoop update *`)
- Upgrade installed [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) packages (`winget upgrade --all`)
- Run regular [Windows Update](https://support.microsoft.com/en-us/windows/update-windows-3c5ae7fc-9fb6-9af1-1984-b5e0412c556a) process
  - If installed, this will use the [`PSWindowsUpdate` module for PowerShell](https://www.powershellgallery.com/packages/PSWindowsUpdate) to show update progress
  - Otherwise, Windows's built-in `UsoClient ScanInstallWait` and `UsoClient StartInstall` will be used and the update progress will have to be followed manually through Control Panel/Windows Settings

## Linux

If ran on Linux, Topgrade will execute the following steps (when the relevant software is installed):

- Update installed [Nushell](https://www.nushell.sh) packages with [Packer.nu](https://github.com/Jan9103/packer.nu) (`packer update`)
- Run system update (update package repositories and upgrade all system packages)
  - This uses the package manager used by your distro:
    - For [Alpine Linux](https://www.alpinelinux.org), this will use [Alpine Package Keeper](https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper) (`apk update` and `apk upgrade`)
    - For [Arch Linux](https://archlinux.org), this will use **the first** available package manager from the following list:
      - [Garuda Update](https://wiki.garudalinux.org/en/garuda-update) (`garuda-update`)
      - [Paru](https://github.com/Morganamilo/paru) (`paru --pacman pacman -Syu`)
        - If available, [Powerpill](https://wiki.archlinux.org/title/Powerpill) is passed to `--pacman` option instead of [pacman](https://wiki.archlinux.org/title/Pacman)
      - [Yay](https://github.com/Jguer/yay) (`yay --pacman pacman -Syu`)
        - If available, [Powerpill](https://wiki.archlinux.org/title/Powerpill) is passed to `--pacman` option instead of [pacman](https://wiki.archlinux.org/title/Pacman)
      - [trizen](https://github.com/trizen/trizen/blob/master/TRIZEN.md) (`trizen -Syu`)
      - [pikaur](https://github.com/actionless/pikaur) (`pikaur -Syu`)
      - [Pamac](https://wiki.manjaro.org/index.php/Pamac) (`pamac upgrade`)
      - [Powerpill](https://wiki.archlinux.org/title/Powerpill) (`powerpill -Syu`)
      - [pacman](https://wiki.archlinux.org/title/Pacman) (`pacman -Syu`)
      - [Aura](https://github.com/fosskers/aura) (`aura -Au` and `aura -Syu`)
    - For [CentOS](https://www.centos.org) and [Fedora Linux](https://fedoraproject.org) (excluding [Silverblue](https://fedoraproject.org/silverblue/)), this will run first one of the following:
      - `rpm-ostree upgrade` - if [rpm-ostree](https://rpm-ostree.readthedocs.io/en/latest/) is available and `rpm_ostree` option is enabled in topgrade's config file
      - `dnf distro-sync` - if `redhat_distro_sync` option is enabled in topgrade's config file
      - `dnf upgrade` - in all other cases
      - **Note:** [Yum](https://fedoraproject.org/wiki/Yum) will be used instead of [DNF](https://github.com/rpm-software-management/dnf), if the latter is not available
    - For [Fedora Silverblue](https://fedoraproject.org/silverblue/), this will use [rpm-ostree](https://rpm-ostree.readthedocs.io/en/latest/) (`rpm-ostree upgrade`)
    - For [Clear Linux OS](https://clearlinux.org), this will use [swupd](https://clearlinux.github.io/clear-linux-documentation/guides/clear/swupd.html) (`swupd update`)
    - For [Debian](https://www.debian.org) (and by extension many of its derivatives such as [Ubuntu](https://ubuntu.com) or [Linux Mint](https://linuxmint.com)), this will run **the first** available package manager from the following list:
      - [apt-fast](https://github.com/ilikenwf/apt-fast) (`apt-fast update` and `apt-fast dist-upgrade`)
      - [mist](https://github.com/makedeb/mist) (`mist update` and `mist upgrade`)
      - [nala](https://gitlab.com/volian/nala) (`nala upgrade`)
      - [APT](https://en.wikipedia.org/wiki/APT_(software)) (`apt-get update` and `apt-get dist-upgrade`)
    - For [Gentoo](https://www.gentoo.org), this will run:
      - [Layman](https://wiki.gentoo.org/wiki/Layman) (`layman -s ALL`)
      - [emerge](https://wiki.gentoo.org/wiki/Emerge) (`emerge --sync` and `emerge -uDNa --with-bdeps=y world`)
      - [eix](https://wiki.gentoo.org/wiki/Eix) (`eix-update`)
    - For [openSUSE](https://opensuse.org) (excluding [Tumbleweed](https://get.opensuse.org/tumbleweed/) and [MicroOS](https://get.opensuse.org/microos/)), this will use [Zypper](https://en.opensuse.org/Portal:Zypper) (`zypper refresh` and `zypper upgrade`)
    - For [openSUSE Tumbleweed](https://opensuse.org/tumbleweed/), this will use [Zypper](https://en.opensuse.org/Portal:Zypper) (`zypper refresh` and `zypper dist-upgrade`)
    - For [openSUSE MicroOS](https://get.opensuse.org/microos/), this will use [Transactional Updates](https://kubic.opensuse.org/documentation/transactional-update-guide/transactional-update.html) (`transactional-update dup`)
    - For [Vanilla OS](https://vanillaos.org), this will use [apx](https://documentation.vanillaos.org/docs/apx/) (`apx update --all` and `apx upgrade --all`)
    - For [Void Linux](https://voidlinux.org), this will use [XBPS](https://docs.voidlinux.org/xbps/index.html) (`xbps-install -Su xbps` and `xbps-install -u`)
    - For [Solus](https://getsol.us), this will use [eopkg](https://help.getsol.us/docs/user/quick-start/package-management/eopkg) (`eopkg upgrade`)
    - For [Exherbo](http://exherbo.org), this will use [Paludis](https://wiki.gentoo.org/wiki/Paludis):
      - `cave resolve world -c1 -Cs -km -Km -x`
      - `cave fix-linkage -x -- -Cs`
      - `eclectic config interactive`
    - For [NixOS](https://nixos.org), this will use [nixos-rebuild](https://nixos.wiki/wiki/Nixos-rebuild) (`/run/current-system/sw/bin/nixos-rebuild switch --upgrade`)
    - For [KDE neon](https://neon.kde.org), this will use [PackageKit](https://www.freedesktop.org/software/PackageKit/pk-intro.html) (`pkcon refresh` and `pkcon update`)
    - For [Bedrock Linux](https://bedrocklinux.org), this will use [brl](https://www.freedesktop.org/software/PackageKit/pk-intro.html) (`brl update`) and the appropriate package manager (as listed above) for each [stratum](https://bedrocklinux.org/0.7/basic-usage.html#strata)
    - For [OpenMandriva](https://openmandriva.org), this will use [DNF](https://github.com/rpm-software-management/dnf) (`dnf upgrade`)
    - For [PCLinuxOS](https://www.pclinuxos.com), this will use [APT](https://en.wikipedia.org/wiki/APT_(software)) (`apt-get update` and `apt-get dist-upgrade`)
- Run configuration update (`etc-update` or `pacdiff`)
- Update [Brew](https://brew.sh) and installed [Brew](https://brew.sh) formulae (`brew update`, `brew upgrade --ignore-pinned --formula`)
- Update installed AppImage packages managed by ["AM"](https://github.com/ivan-hc/AM-Application-Manager) (`am -u`)
- Update installed AppImage packages managed by [AppMan](https://github.com/ivan-hc/AppMan) (`appman -u`)
- Upgrade deb packages managed by [deb-get](https://github.com/wimpysworld/deb-get) (`deb-get update` and `deb-get upgrade`)
- Upgrade all [Toolbx](https://containertoolbx.org) toolboxes by running currently used topgrade executable inside it (`toolbox run -c ${TOOLBOX_NAME} /run/host/${PATH_TO_TOPGRADE} --only system --no-self-update --skip-notify`)
  - This does not require `topgrade` to be installed within the toolbox
- Update installed [Flatpak](https://flatpak.org) user packages (`flatpak update --user`)
- Update installed [Flatpak](https://flatpak.org) system packages (`flatpak update --system`)
- Update (refresh) installed [Snap](https://snapcraft.io/about) packages (`snap refresh`)
- Update [Pacstall](https://pacstall.dev) and installed [Pacstall](https://pacstall.dev) packages (`pacstall -U` and `pacstall -Up`)
- Install managed and review unmanaged packages from the currently installed [pacdef](https://github.com/steven-omaha/pacdef) groups (`pacdef package sync` and `pacdef package review`)
- Update [Proton-GE](https://github.com/GloriousEggroll/proton-ge-custom) to the latest version using [protonup](https://github.com/AUNaseef/protonup) (`protonup`)
- Upgrade all [distroboxes](https://distrobox.privatedns.org/) (`distrobox upgrade`)
- Update installed [devKitPro](https://devkitpro.org/wiki/About) tools and libraries using [dkp-pacman](https://devkitpro.org/wiki/devkitPro_pacman) (`dkp-pacman -Syu`)
- Update [Pi-hole](https://pi-hole.net) (`pihole -up`)
- Run firmware upgrades (`fwupdmgr refresh` and `fwupdmgr get-updates`)
- Check for needed restarts (`needrestart`)

## macOS

If ran on macOS, Topgrade will execute the following steps (when the relevant software is installed):

- Update [Brew](https://brew.sh) and installed [Brew](https://brew.sh) formulae and casks (`brew update`, `brew upgrade --ignore-pinned --formula`)
  - This is done for both Intel and ARM installs of Brew if both are present
- Update installed [Brew](https://brew.sh) casks (`brew cu`)
  - This is done for both Intel and ARM installs of Brew if both are present
  - If installed, this will use [brew-cask-upgrade](https://github.com/buo/homebrew-cask-upgrade) (`brew cu -y`)
  - Otherwise, Brew's built-in upgrade command will be used (`brew upgrade --cask`)
- Upgrade [MacPorts](https://www.macports.org) itself as well as installed ports (`port selfupdate` and `port -u upgrade outdated`)
- Upgrade all applications present in the `/Applications` folder that use [Sparkle](https://sparkle-project.org) as their update framework (`sparkle bundle --check-immediately --application ${PATH_TO_APP}` ran on compatible apps)
  - This requires [sparkle-cli](https://sparkle-project.org/documentation/sparkle-cli/) to be installed
- Update all [App Store](https://www.apple.com/app-store/) apps through [mas-cli](https://github.com/mas-cli/mas) (`mas upgrade`)
- [Check for macOS system update](https://support.apple.com/en-us/HT201541) and offer to install it (`softwareupdate --list` and `softwareupdate --install --all --no-scan`)
