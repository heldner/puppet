class syslog_ng (
  $package_name = params_lookup( 'package_name' ),
  $ensure       = params_lookup( 'ensure' ),
  $config_path  = params_lookup( 'config_path' )
  ) inherits syslog_ng::params {

  validate_re($ensure, ['\Aabsent|present\Z',])

  package { 'syslog-ng':
    name   => $package_name,
    ensure => $ensure,
  } ->

  file { 'syslog-ng.conf':
    ensure  => $ensure,
    path    => $config_path,
    content => template("${module_name}/syslog-ng.conf.erb")
  } ->

  service { 'syslog-ng':
    ensure    => 'running',
    enable    => true,
    subscribe => File['syslog-ng.conf']
  }

}
