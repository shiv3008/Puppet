file { 'Message File or Name of the purpose of the file':
ensure => 'file',
content => 'Welcome to my server again',
path => '/etc/motd',
}
