#!/bin/bash

puppet apply --modulepath '$basemodulepath:..' -e 'class {"dotfiles::install::server": }' --hiera_config hiera.yaml
