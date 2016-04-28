class dotfiles {
  file { ['/etc', '/etc/vim']:
    ensure => directory
  }->
  file { '/etc/vim/vimrc':
    ensure => file,
    content => template('dotfiles/vimrc'),
  }->
  file { '/etc/bash.bashrc':
    ensure => file,
    content => template('dotfiles/bashrc'),
  }->
  file { '/etc/tmux.conf':
    ensure => file,
    content => template('dotfiles/tmux.conf'),
  }->
  file { ['/etc/i3']:
    ensure => directory
  }->
  file { '/etc/i3/config':
    ensure => file,
    content => template('dotfiles/tmux.conf'),
  }

  file { ['/usr', '/usr/local', '/usr/local/bin']:
    ensure => directory
  }->
  file { '/usr/local/bin/c':
    ensure => file,
    mode => 755,
    content => template('dotfiles/c'),
  }->
  file { '/usr/local/bin/xrandr2':
    ensure => file,
    mode => 755,
    content => template('dotfiles/xrandr2'),
  }

}

