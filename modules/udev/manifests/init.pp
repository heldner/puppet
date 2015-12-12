class udev {

  package { 'udev':
    ensure => 'installed'
  }

  $rules = hiera_hash('udev::rules')
  validate_hash($rules)
  create_resources('udev::rules', $rules)

}
