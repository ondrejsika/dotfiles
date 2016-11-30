class dotfiles::desktop {
  package { ['i3', 'xorg']:
    ensure => present,
  }->
  file { ['/etc/i3']:
    ensure => directory
  }->
  file { '/etc/i3/config':
    ensure => file,
    content => template('dotfiles/desktop/i3'),
  }

  file { '/usr/local/bin/xrandr2':
    ensure => file,
    mode => '755',
    content => template('dotfiles/desktop/xrandr2'),
  }

  package { "zenity":
    ensure => present,
  }->
  file { '/usr/local/bin/w':
    ensure => file,
    mode => '755',
    content => template('dotfiles/desktop/w'),
  }

  file { '/etc/bash.settitle':
    ensure => file,
    content => template('dotfiles/desktop/settitle'),
  }

  $install_packages = [
    'gnome-terminal',
    'gnome-disk-utility',
    'openjdk-8-jre',
    'texlive-latex-base',
    'texlive-latex-extra',
    'gnupg',
    'libreoffice',
    'openvpn',
    'dnsmasq',
    'moc',
    'vlc',
    'evince',
    'gimp',
    'wicd',
    'wicd-cli',
    'wicd-gtk',
    'gitk',
    'xbacklight',
    'lxrandr',
    'gpa',
    'eog',
    'chromium',
    'icedove',
    'vim-gtk',
  ];
  package { $install_packages:
    ensure => installed,
  }

  $purged_packages = [
  ];
  package { $purged_packages:
    ensure => purged,
  }
}

