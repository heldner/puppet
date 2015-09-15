class autofs (
  $ensure  = 'present',
  $sources = {}
  ) {

  validate_re( $ensure, ['present', 'absent'])

  $service_ensure = $ensure ? {
    'present' => 'running',
    'absent'  => 'stopped',
    default   => 'running'
  }

  $pkgs = [
    'cifs-utils',
    'autofs'
  ]

  package { $pkgs:
    ensure => $ensure
  } ->

  file { 'auto.master':
    ensure  => $ensure,
    path    => '/etc/auto.master',
    content => template("${module_name}/auto.master.erb"),
  }

  service { 'autofs':
    ensure    => $service_ensure,
  }

  if $ensure == 'present' {
    File['auto.master'] ->
    Service['autofs']
    File['auto.master'] ~>
    Service['autofs']
  } else {
    Service['autofs'] ->
    File['auto.master']
  }

}
