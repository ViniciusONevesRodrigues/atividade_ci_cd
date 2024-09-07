node default {
  class { 'mysql':
    root_password => 'rootpassword',
    databases     => {
      'mydatabase' => {
        ensure => 'present',
      },
    },
  }
  
  exec { 'setup-database':
    command => 'mysql -uroot -prootpassword mydatabase < /etc/puppetlabs/code/modules/mysql/files/db_setup.sql',
    path    => ['/usr/bin'],
    unless  => 'mysql -uroot -prootpassword -e "USE mydatabase;"',
    require => Class['mysql'],
  }
}
