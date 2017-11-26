host { 'timeserver':
  ensure       => 'present',
  host_aliases => ['tock', 'localhost4.localdomain4'],
  ip           => '198.168.0.3',
  target       => '/etc/hosts',
}
