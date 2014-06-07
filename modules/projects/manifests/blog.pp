# Personal Blog
# https://github.com/faun/blog
class projects::blog {
  boxen::project { 'blog':
    dir         => "${boxen::config::srcdir}/faun/blog",
    server_name => 'faun.dev',
    source      => 'faun/blog',
    ruby        => '2.0.0-p353',
    nginx       => 'projects/shared/nginx.middleman.conf.erb',
  }
}
