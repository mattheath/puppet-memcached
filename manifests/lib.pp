class memcached::lib {
  include memcached

  package { 'libmemcached':
    ensure  => '1.0.18',
  }

}
