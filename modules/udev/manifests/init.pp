class udev (
  $rules = undef,
  ) {

  package { 'udev':
    ensure => 'installed'
  }

  if $rules!= undef {
    validate_hash($rules)
    create_resources('udev::rules', $rules)
  }

}
