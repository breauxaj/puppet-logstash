logstash
========

Logstash is a data pipeline that helps you process logs and other event data
from a variety of systems.

Samples
-------
```
include logstash
```
```
class { 'logstash': version => '1.5' }
```
```
logstash::service { 'default':
  ensure => running,
  enable => true
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
