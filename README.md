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
```

# Apply Server

```
sudo puppet apply --modulepath '$basemodulepath:..' -e 'class {"dotfiles::install::server": }' --hiera_config hiera.yaml
```

# Apply Desktop

```
sudo puppet apply --modulepath '$basemodulepath:..' -e 'class {"dotfiles::install::desktop": }' --hiera_config hiera.yaml
```

# Build

```
puppet module build .
```

