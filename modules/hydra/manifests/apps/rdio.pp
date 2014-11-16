class hydra::apps::rdio {

  include brewcask

  package { 'rdio': provider => 'brewcask' }

}
