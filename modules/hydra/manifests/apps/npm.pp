# Include global packages for the whole team
class hydra::apps::npm {

  $version = 'v0.10.33'

  # install any arbitrary nodejs version
  nodejs::version { $version: }

  # set the global nodejs version
  class { 'nodejs::global': version => $version }

  nodejs::module { [ 'coffee-script', 'coffeelint', 'jshint' ]:
    node_version => $version;
  }

}
