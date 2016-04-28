class desktop {
  file { ['/etc/i3']:
    ensure => directory
  }->
  file { '/etc/i3/config':
    ensure => file,
    content => template('dotfiles/desktop/i3'),
  }

  file { '/usr/local/bin/xrandr2':
    ensure => file,
    mode => 755,
    content => template('dotfiles/desktop/xrandr2'),
  }->
  file { '/usr/local/bin/w':
    ensure => file,
    mode => 755,
    content => template('dotfiles/desktop/w'),
  }

}

