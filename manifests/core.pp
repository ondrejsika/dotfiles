class dotfiles::core {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }
  Exec["apt-update"] -> Package <| |>

  $samba_servers = lookup('samba_servers')
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

  ssh_authorized_key { 'ondrej@ondrejsika.com':
    ensure => present,
    user   => ['root', 'sika'],
    type   => 'ssh-rsa',
    #key    => template('dotfiles/core/ssh_key_pub'),
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCslNKgLyoOrGDerz9pA4a4Mc+EquVzX52AkJZz+ecFCYZ4XQjcg2BK1P9xYfWzzl33fHow6pV/C6QC3Fgjw7txUeH7iQ5FjRVIlxiltfYJH4RvvtXcjqjk8uVDhEcw7bINVKVIS856Qn9jPwnHIhJtRJe9emE7YsJRmNSOtggYk/MaV2Ayx+9mcYnA/9SBy45FPHjMlxntoOkKqBThWE7Tjym44UNf44G8fd+kmNYzGw9T5IKpH1E1wMR+32QJBobX6d7k39jJe8lgHdsUYMbeJOFPKgbWlnx9VbkZh+seMSjhroTgniHjUl8wBFgw0YnhJ/90MgJJL4BToxu9PVnH',
  }

  $install_packages = [
    'aptitude',
    'ipython',
    'gcc',
    'mc',
    'htop',
    'git',
    'sudo',
    'tig',
    'python-dev',
    'python-pip',
    'curl',
    'tree',
    'vnstat',
    'whois',
    'apt-transport-https',
    'ca-certificates',
    'gnupg2',
    'software-properties-common',

    'nodejs',

    'cifs-utils',
    'nfs-common',

    'ruby',
    'ruby-dev',

    'httpie',
  ]
  package { $install_packages:
    ensure => installed,
  }->
  apt::source { 'docker':
    location => 'https://download.docker.com/linux/debian',
    repos    => 'stable',
    release  => 'stretch',
    key      => {
      id       => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
      'server' => 'pgp.mit.edu',
    },
  }->
  package { 'docker-ce':
    ensure => installed,
  }->
  exec { 'docker sika membership':
    unless  => '/bin/grep -q "docker\\S*docker" /etc/group',
    command => '/usr/sbin/usermod -aG docker sika',
  }->
  package { [
        'docker-compose',
    ]:
    ensure => installed,
    provider => pip,
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

  sudo::conf {'sudoers':
     ensure  => present,
     content => 'sika ALL=(ALL) ALL',
  }


  git::config { 'user.name':
    value => 'Ondrej Sika',
    scope => 'system',
  }

  git::config { 'user.email':
    value => 'ondrej@ondrejsika.com',
    scope => 'system',
  }
}

