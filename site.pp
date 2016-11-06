user { 'gavin':
  uid        => '1000',
  shell      => '/bin/bash',
  home       => '/home/gavin',
  managehome => true,
  ensure     => present
}

file { '/root/puppet_created.txt':
  content => 'It worked!'
}

class { 'postgresql::server': }

postgresql::server::db { 'asm_manager':
  user     => 'orion',
  password => postgresql_password('orion', 'Dell1234'),
}
