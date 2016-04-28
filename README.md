# ondrejsika/dotfiles

My configuration

- author: Ondrej Sika <ondrej@ondrejsika.com>
- license: [MIT](https://ondrejsika.com/license/mit.txt)

## Install

```
git clone git@github.com:ondrejsika/dotfiles.git
sudo puppet apply --modulepath '$basemodulepath:.' -e 'class {"dotfiles": }'
```
