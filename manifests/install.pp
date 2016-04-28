class dotfiles::install {
  class server {
    class {"dotfiles::core": }
  }

  class desktop {
    class {"dotfiles::core": }
    class {"dotfiles::desktop": }
  }
}
