# Include global packages for the whole team
class hydra::apps::npm {
  $version = 'v0.10.33'

  nodejs::version { $version: }

  unless defined(Nodejs::Version[$version]) {
    class { 'nodejs::global':
      version => $version
    }

    $global_modules = ['coffee-script', 'coffeelint', 'jshint']
    nodejs::module { $global_modules:
      node_version => $version
    }
  }

}
