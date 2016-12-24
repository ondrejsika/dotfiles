#!/bin/bash

puppet apply --modulepath '$basemodulepath:..' -e 'class {"dotfiles::install::desktop": }' --hiera_config hiera.yaml
