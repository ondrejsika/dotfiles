class dotfiles::core {
  file { ['/etc/vim']:
    ensure => directory
  }->
  file { '/etc/vim/vimrc':
    ensure => file,
    content => template('dotfiles/core/vimrc'),
  }->
  file { '/etc/bash.bashrc':
    ensure => file,
    content => template('dotfiles/core/bashrc'),
  }->
  file { '/etc/tmux.conf':
    ensure => file,
    content => template('dotfiles/core/tmux.conf'),
  }

  file { '/usr/local/bin/c':
    ensure => file,
    mode => 755,
    content => template('dotfiles/core/c'),
  }

}

