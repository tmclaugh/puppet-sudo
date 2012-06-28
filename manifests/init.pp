# Class: sudo
#
# This module manages sudo
#
# Actions:
#   Installs sudo
#
# Requires:
#   Nothing
#
# Sample Usage:
#   node foo { 
#		include sudo	
#   }
#
# [Remember: No empty lines between comments and class definition]
class sudo inherits sudo::params {

  package { 'sudo':
    ensure => 'present',
  }

  file { "$config_file":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    require => Package['sudo'],
  }
  
  file { "$config_dir":
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0550',
    require => Package['sudo'],
  }
  
  append_if_no_match { "inc_sudoers_dir" :
		file => $config_file,
		line => "\n#includedir $config_dir",
		match => "#includedir.*${config_dir}",
		require => [ File[$config_file], File["$config_dir"] ],
	}
}
