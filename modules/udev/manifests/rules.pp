define udev::rules (
  $ensure   = 'present',
  $priority = 80,
  $content,
  ) {

  validate_re($ensure, ['present', 'absent'])

  include udev::params

  file { "udev_${name}_rule":
    ensure => $ensure,
    path   => "${udev::params::rules_d}/${priority}-${name}.rules",
    mode   => '0644',
    source => $content,
  }

  exec { 'udev_reload':
    command     => 'udevadm control --reload-rules',
    path        => '/sbin',
    subscribe   => File["udev_${name}_rule"],
    refreshonly => true
  }
}
