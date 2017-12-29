#!/bin/bash

puppet apply \
    --modulepath '/etc/puppetlabs/code/modules:/etc/puppetlabs/code/environments/production/modules:..' \
    -e 'class {"dotfiles::install::server": }' \
    --hiera_config hiera.yaml

