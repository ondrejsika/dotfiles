# ondrejsika/dotfiles

My configuration

- author: Ondrej Sika <ondrej@ondrejsika.com>
- license: [MIT](https://ondrejsika.com/license/mit.txt)

## Install

```
apt-get update
apt-get install sudo puppet git
sudo puppet module install puppetlabs-stdlib

git clone git@github.com:ondrejsika/dotfiles.git
cd dotfiles
git clone git@github.com:ondrejsika/dotfiles-hiera.git hiera
sudo puppet apply --modulepath '$basemodulepath:..' -e 'class {"dotfiles": }' --hiera_config hiera.yaml
```

# Build

```
puppet module build .
```

