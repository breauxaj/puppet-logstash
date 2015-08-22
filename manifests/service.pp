define logstash::service (
  $ensure,
  $enable
) {
  include ::logstash

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'logstash',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}
