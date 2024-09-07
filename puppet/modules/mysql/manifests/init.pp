class mysql {
  package { 'mysql-server':
    ensure => installed,
  }

  service { 'mysql':
    ensure    => running,
    enable    => true,
    subscribe => Package['mysql-server'],
  }

  file { '/etc/mysql/my.cnf':
    ensure  => file,
    content => '...custom MySQL configuration...',
    notify  => Service['mysql'],
  }

  # Create the MySQL database and user
  exec { 'create-database':
    command => 'mysql -uroot -prootpassword -e "CREATE DATABASE IF NOT EXISTS mydatabase;"',
    path    => ['/usr/bin'],
    unless  => 'mysql -uroot -prootpassword -e "USE mydatabase;"',
    require => Package['mysql-server'],
  }
}
