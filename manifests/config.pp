define logstash::config (
  $priority,
  $rules
) {
  $confd = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/logstash/conf.d',
  }

  file { "${confd}/${priority}-${name}.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template('logstash/conf.erb'),
  }

}
