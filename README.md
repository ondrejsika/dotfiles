# ondrejsika/dotfiles

My configuration

- author: Ondrej Sika <ondrej@ondrejsika.com>
- license: [MIT](https://ondrejsika.com/license/mit.txt)

## Install

```
apt-get update
apt-get install sudo puppet

git clone git@github.com:ondrejsika/dotfiles.git
sudo puppet apply --modulepath '$basemodulepath:.' -e 'class {"dotfiles": }'
```

# Build

```
puppet module build .
```

