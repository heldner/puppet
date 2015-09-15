class mpd (
  $ensure    = params_lookup( 'ensure' ),
  $music_dir = params_lookup( 'music_dir' ),
  $use_pulse = params_lookup( 'use_pulse' ),
  ) inherits mpd::params {

  validate_re($ensure, ['\Aabsent|present\Z',])

  $pkgs = [
    'mpd',
    'mpc',
    'ncmpcpp'
  ]

  package { $pkgs:
    ensure => $ensure,
  } ->

  file { 'mpd.conf':
    ensure  => $ensure,
    path    => '/etc/mpd.conf',
    owner   => 'mpd',
    group   => 'audio',
    mode    => '0640',
    content => template("${module_name}/mpd.conf.erb")
  } ->

  service { 'mpd':
    ensure    => 'running',
    enable    => true,
    subscribe => File['mpd.conf']
  }

}
