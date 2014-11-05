# Include global packages for the whole team
class hydra::apps::npm {

  $version = 'v0.10.33'

  class {
    'nodejs::global':
      version => $version;
  }

  nodejs::module {
    'coffee-script':
      node_version => $version;

    'coffeelint':
      node_version => $version;

    'jshint':
      node_version => $version;
  }

}
