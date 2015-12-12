define udev::rules (
  $ensure   = 'present',
  $priority = 80,
  $content,
  ) {

  validate_re($ensure, ['present', 'absent'])

  include udev::params
  include udev::reload_rules

  file { "udev_${name}_rule":
    ensure => $ensure,
    path   => "${udev::params::rules_d}/${priority}-${name}.rules",
    mode   => '0644',
    source => $content,
    notify => Class['udev::reload_rules'],
  }

}
