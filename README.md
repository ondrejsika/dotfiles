# ondrejsika/dotfiles

    2014 Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/dotfiles

My configuration files for desktop (Mac) and servers (Debian)


## Desktop (Mac)

```
./apply-mac.sh
```

### Install Brew Packages

```
(cd mac/brew/ && brew bundle)
```

### Save Brew Packages

```
(rm -rf mac/brew/Brewfile && cd mac/brew/ && brew bundle dump)
```

## Server (Debian)

```
./apply-server.sh
```
