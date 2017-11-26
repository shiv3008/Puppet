package { 'http' :
ensure => 'installed',	#'absent',,'purged','latest','4.1'
name => 'httpd',	#not used here as we make use of title
provider => 'yum',	# Normally not required
}
service { 'httpd':
ensure => 'running',	#'stopped',
#name => 'httpd',	#Useful where the service name is different,
enable => true,	#false like checkfonfig ON in linux
}
