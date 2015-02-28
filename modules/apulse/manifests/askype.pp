class apulse::askype (
  $ensure = pick($ensure, 'present'),
  ) inherits apulse {

  file { 'askype':
    ensure => $ensure,
    path   => '/usr/local/bin/askype',
    mode   => 0755,
    source => "puppet:///modules/${module_name}/askype",
  }

}
