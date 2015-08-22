class logstash (
  $version = '1.5',
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'logstash',
  }

  $distro = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'centos',
  }

  yumrepo { 'logstash':
    baseurl        => "http://packages.elasticsearch.org/logstash/${version}/${distro}'
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
    descr          => "Logstash repository for ${version}.x packages",
  }

  package { $required:
    ensure  => installed,
    require => [
      Yumrepo['logstash'],
      User['logstash'],
      Group['logstash'],
    ]
  }

  group { 'logstash':
    ensure => present,
    gid    => 3333,
  }

  user { 'logstash':
    ensure     => present,
    gid        => 3333,
    home       => '/opt/logstash',
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => 3333,
  }

}
