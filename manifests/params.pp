class sudo::params {
  case $::operatingsystem {
    ubuntu, debian, gentoo: {
      $package = 'sudo'
      $config_file = '/etc/sudoers'
      $config_dir = '/etc/sudoers.d/'
    }
    redhat, centos, fedora: {
      $package = 'sudo'
      $config_file = '/etc/sudoers'
      $config_dir = '/etc/sudoers.d/'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
