class dotfiles::core {
  $servers = hiera('servers')
  $samba_servers = hiera('samba_servers')
  $drives = hiera('drives')
  package { 'vim':
    ensure => present,
  }->
  file { ['/etc/vim', '/etc/vim/autoload', '/etc/vim/bundle']:
    ensure => directory
  }->
  file { '/etc/vim/vimrc':
    ensure => file,
    content => template('dotfiles/core/vimrc'),
  }->
  file { '/etc/vim/autoload/pathogen.vim':
    ensure => file,
    content => template('dotfiles/core/3rdparty/pathogen.vim'),
  }

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
    'aptitude',
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

    'nodejs',
    'npm',

    'cifs-utils',
    'nfs-common',

    'ruby',
    'ruby-dev',
  ]
  package { $install_packages:
    ensure => installed,
  }

  $install_gem_packages = [
    'jekyll',
  ]
  package { $install_gem_packages:
    ensure => installed,
    provider => gem,
  }

  $purged_packages = [
    'nano',
  ]
  package { $purged_packages:
    ensure => purged,
  }
}

