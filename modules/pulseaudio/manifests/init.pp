class pulseaudio (
  $ensure   = 'present',
  $use_dmix = true
  ) {

  $pulse_pkgs = [
    'pulseaudio',
    'pavucontrol'
  ]

  validate_re($ensure, ['absent', 'present',])

  package { $pulse_pkgs:
    ensure => $ensure
  } ->

  file { 'default.pa':
    ensure  => $ensure,
    path    => '/etc/pulse/default.pa',
    content => template("${module_name}/default.pa.erb"),
    notify  => Exec['kill_pa']
  } ->

  service { 'pulseaudio':
    enable => false
  }

  exec { 'kill_pa':
    command     => 'pkill -9 pulseaudio',
    path        => '/usr/bin',
    refreshonly => true,
    require     => Package[$pulse_pkgs]
  }

}

