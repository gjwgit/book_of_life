<!-- markdownlint-disable MD013 -->

# BookOfLife Installers

Flutter supports multiple platform targets. Flutter based apps can run
native on Android, iOS, Linux, MacOS, and Windows, as well as directly
in a browser from the web. Flutter functionality is essentially
identical across all platforms so the experience across different
platforms will be very similar.

Visit the
[CHANGELOG](https://github.com/gjwgit/bookoflife/blob/dev/CHANGELOG.md)
for the latest updates.

Run the app online: [**web**](https://bookoflife.solidcommunity.au).

Download the latest version:

+ **Android**
  [aab](https://solidcommunity.au/installers/bookoflife.aab) or
  [apk](https://solidcommunity.au/installers/bookoflife.apk);
+ **GNU/Linux**
  [deb](https://solidcommunity.au/installers/bookoflife_amd64.deb) or
  [snap](https://solidcommunity.au/installers/bookoflife_amd64.snap) or
  [zip](https://solidcommunity.au/installers/bookoflife-linux.zip);
+ **macOS**
  [dmg](https://solidcommunity.au/installers/bookoflife-macos.dmg) or
  [zip](https://solidcommunity.au/installers/bookoflife-macos.zip);
+ **Windows**
  [inno](https://solidcommunity.au/installers/bookoflife-windows-inno.exe) or
  [zip](https://solidcommunity.au/installers/bookoflife-windows.zip).

## Prerequisite

There are no specific prerequisites for installing and running the
app.

## Android

You can side load the latest version of the app by downloading the
[installer](https://solidcommunity.au/installers/bookoflife.apk)
through your Android device's browser. This will download the app to
your Android device. Then visit the Downloads folder (choosing the
menu option in the browser) where you can click on the
`bookoflife.apk` file. Your browser will ask if you would like to
installing the app locally.

## Linux

### Deb Install for Debian/Ubuntu

Download
[bookoflife_amd64.deb](https://solidcommunity.au/installers/bookoflife_amd64.deb)
and install:

```bash
wget https://solidcommunity.au/installers/bookoflife_amd64.deb -O bookoflife_amd64.deb
sudo dpkg --install bookoflife_amd64.deb
```

### Linux Snap Install

Download
[bookoflife_amd64.snap](https://solidcommunity.au/installers/bookoflife_amd64.snap)
and install:

```bash
wget https://solidcommunity.au/installers/bookoflife_amd64.snap -O bookoflife_amd64.snap
sudo snap install --dangerous bookoflife_amd64.snap
```

### Linux Zip Install

Download
[bookoflife-linux.zip](https://solidcommunity.au/installers/bookoflife-linux.zip)

To try it out:

```bash
wget https://solidcommunity.au/installers/bookoflife-linux.zip -O bookoflife-linux.zip
unzip bookoflife-linux.zip -d bookoflife
./bookoflife/bookoflife
```

To install for the local user and to make it known to GNOME and KDE
with a desktop icon for their desktop (which is automatically done
using the deb or snap installations), begin by downloading the **zip**
and installing that into a local folder:

```bash
unzip bookoflife-linux.zip -d ${HOME}/.local/share/bookoflife
```

Then set up your local installation (only required once):

```bash
ln -s ${HOME}/.local/share/bookoflife/bookoflife ${HOME}/.local/bin/
wget https://raw.githubusercontent.com/gjwgit/bookoflife/dev/installers/app.desktop -O ${HOME}/.local/share/applications/bookoflife.desktop
sed -i "s/USER/$(whoami)/g" ${HOME}/.local/share/applications/bookoflife.desktop
mkdir -p ${HOME}/.local/share/icons/hicolor/256x256/apps/
wget https://github.com/gjwgit/bookoflife/raw/dev/installers/app.png -O ${HOME}/.local/share/icons/hicolor/256x256/apps/bookoflife.png
```

To install for any user on the computer:

```bash
sudo unzip bookoflife-linux.zip -d /opt/bookoflife
sudo ln -s /opt/bookoflife/bookoflife /usr/local/bin/
wget https://raw.githubusercontent.com/gjwgit/bookoflife/dev/installers/app.desktop -O ${HOME}/usr/local/share/applications/bookoflife.desktop
wget https://github.com/gjwgit/bookoflife/raw/dev/installers/app.png -O ${HOME}/use/local/share/icons/bookoflife.png
```

Once installed you can run the app from the GNOME desktop through
Alt-F2 and type `bookoflife` then Enter.

## macOS

### macOS Zip Install

Download
[bookoflife-macos.zip](https://solidcommunity.au/installers/bookoflife-macos.zip).

Open the downloaded file on your Mac. Then, holding the Control key
click on the app icon to display a menu. Choose `Open`. Then accept
the warning (or give permission to install the app) to then run the
app. The app should run without the warning next time.

## Web -- No Installation Required

No installer is required for a browser based experience of
Bookoflife. Simply visit
[https://bookoflife.solidcommunity.au](https://bookoflife.solidcommunity.au).

Also, your Web browser will provide an option in its menus to install
the app locally, which can add an icon to your home screen to start
the web-based app directly.

## Windows

### Windows Self Extracting Archive

Download and run the self extracting archive
[bookoflife-windows-inno.exe](https://solidcommunity.au/installers/bookoflife-windows-inno.exe)
to self install the app on Windows.
