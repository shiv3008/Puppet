case $facts['os']['family'] {
  'RedHat': {
    $http_service = 'httpd'
     }
  }
  default {
    fail("Your ${facts['os']['family']} is not supported")
  }

package { 'http' :
ensure => 'installed',  #'absent',,'purged','latest','4.1'
name => 'httpd',        #not used here as we make use of title
provider => 'yum',      # Normally not required
}
file { 'http_file':
ensure => 'file',
content => 'Welcome to my server again',
path => '/var/www/html',
}
service { 'httpd':
ensure => 'running',    #'stopped',
#name => 'httpd',       #Useful where the service name is different,
enable => true, #false like checkfonfig ON in linux
}
