# Faun
class people::faun {

  $env = {
    github_user => 'faun',
    directories => {
      home      => "/Users/${::boxen_user}",
      src       => '/Users/faun/src/',
      my_src    => '/Users/faun/src/faun',
    }
  }

  case $::hostname {
    'unicorn': {
      include projects::all
    }
    default: {}
  }

  repository { 'faun-dotfiles':
    source  => 'faun/dotfiles',
    path    => "${env['directories']['my_src']}/dotfiles"
  }
}
