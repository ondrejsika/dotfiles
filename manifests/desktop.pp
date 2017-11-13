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

   service { 'dnsmasq':
    ensure  => 'running',
    enable  => true,
    require => Package['dnsmasq'],
  }

  file { '/etc/reslv.conf':
    ensure => file,
    content => '127.0.0.1',
  }->
  file { '/etc/dnsmasq.conf':
    notify => Service['dnsmasq'],
    ensure => file,
    content => template('dotfiles/desktop/dnsmasq.conf')

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


  apt::source { 'virtualbox':
    location => 'http://download.virtualbox.org/virtualbox/debian',
    repos    => 'contrib',
    release  => 'stretch',
    key      => {
      id       => 'B9F8D658297AF3EFC18D5CDFA2F683C52980AECF',
      'server' => 'pgp.mit.edu',
    },
  }->
  package { 'virtualbox-5.1':
    ensure => installed,
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
    'thunderbird',
    'vim-gtk',
    'virt-manager',
    'alsa-utils',
  ]
  package { $install_packages:
    ensure => installed,
  }

  $purged_packages = [
  ]
  package { $purged_packages:
    ensure => purged,
  }
}

