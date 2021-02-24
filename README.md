# ondrejsika/dotfiles

    2014 Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/dotfiles

My configuration files for desktop (Mac) and servers (Debian) of:

- bash
- vim
- git
- hammerspoon
- chunkwm - i3 alternative for Mac (inside hammerspoon)
- brew (package list)
- i3 (Linux desktop)

## Desktop (Mac)

```
./apply-mac.sh
```

### Install Brew Packages

```
./brew-install.sh
```

### Save Brew Packages

```
./brew-save.sh
```

## Server (Debian)

```
./apply-server.sh
```

## Setup Shared

```
cd
git clone https://github.com/ondrejsika/dotfiles.git .dotfiles-ondrejsika
cd .dotfiles-ondrejsika
./apply-shared.sh
cd
. .ondrejsika.bashrc
```

## Activate Shared

```
. ~/.ondrejsika.bashrc
```
