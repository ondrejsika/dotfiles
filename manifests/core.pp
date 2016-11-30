class dotfiles::core {
  package { 'vim':
    ensure => present,
  }->
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
  }

  package { 'tmux':
    ensure => present,
  }->
  file { '/etc/tmux.conf':
    ensure => file,
    content => template('dotfiles/core/tmux.conf'),
  }

  file { '/usr/local/bin/c':
    ensure => file,
    mode => '755',
    content => template('dotfiles/core/c'),
  }

  file { ['/root/.ssh', '/home/sika/.ssh']:
    ensure  => 'directory',
  }->
  file { ['/root/.ssh/authorized_keys', '/home/sika/.ssh/authorized_keys']:
    ensure  => 'present',
    mode    => '600',
  }->
  file_line {'ssh_authorized_key_sika':
    path => '/home/sika/.ssh/authorized_keys',
    line => template('dotfiles/core/id_rsa.pub'),
  }->
  file_line {'ssh_authorized_key_root':
    path => '/root/.ssh/authorized_keys',
    line => template('dotfiles/core/id_rsa.pub'),
  }

  $install_packages = [
    'ipython',
    'gcc',
    'mc',
    'htop',
    'git',
    'sudo',
    'puppet',
    'tig',
    'python-dev',
    'python-pip',
    'curl',
  ];
  package { $install_packages:
    ensure => installed,
  }

  $purged_packages = [
    'nano',
  ];
  package { $purged_packages:
    ensure => purged,
  }
}

