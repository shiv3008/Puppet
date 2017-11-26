case $facts['os']['family'] {
  'RedHat': {
    $ntp_service = 'ntpd'
    $admingroup = 'wheel'
  }
  'Debian': {
    $ntp_service = 'ntp'
    $admingroup = 'sudo'
  }
  default : {
    fail("Your ${facts['os']['family']} is not supported")
  }
}

package { 'ntp':
  before => File['/etc/ntp.conf'],
}

File {
  owner  => 'root',
  group  => $admingroup,
  mode   => '0664',
  ensure => 'file',
}

file { '/etc/ntp.conf':
  content => $ntp_conf,
  notify  => Service['NTP_Service'],
}

service {'NTP_Service':
  ensure    => 'running',
  enable    => true,
  name      => $ntp_service,
  subscribe => File['/etc/ntp.conf'],
}
