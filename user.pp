 user { 'bob':
ensure => 'present',
managehome => true,
groups => [ 'sudo', 'users'],
password => pw_hash('Password1','SHA-512','salt'),
}
package {'puppetlabs-stdlib':
ensure => 'installed',
provider => 'yum',      # Normally not required
}
group {'admins':
ensure => 'present',
}
group {[ 'sudo', 'users']:
ensure => 'present',
}
