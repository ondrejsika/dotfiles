# ondrejsika/dotfiles

My configuration

- author: Ondrej Sika <ondrej@ondrejsika.com>
- license: [MIT](https://ondrejsika.com/license/mit.txt)

## Install

```
apt-get update
apt-get install -y sudo puppet git
sudo puppet module install puppetlabs-stdlib

git clone git@github.com:ondrejsika/dotfiles.git
cd dotfiles
git clone git@github.com:ondrejsika/dotfiles-hiera.git hiera
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

