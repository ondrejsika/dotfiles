# ondrejsika/dotfiles

    2014 Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/dotfiles

My configuration files for desktop (Mac) and servers (Debian)


## Install

```
apt-get update
apt-get install -y sudo git

git clone git@github.com:ondrejsika/dotfiles.git
cd dotfiles
git clone git@github.com:ondrejsika/dotfiles-hiera.git hiera

sudo ./install-puppet.sh
sudo ./install-dependencies.sh
```

## Apply Server

```
sudo ./apply-server.sh
```

## Apply Desktop

```
sudo ./apply-desktop.sh
```

## Build

```
puppet module build .
```

