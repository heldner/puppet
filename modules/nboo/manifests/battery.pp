class nboo::battery (
  $ensure   = 'present',
  $lowlevel = 20,
  $critical = 10
  ) {

  validate_re($ensure, ['\Aabsent|present\Z',])

  $full_path = '/usr/local/bin/batt_check'

  file { 'batt_check':
    ensure  => $ensure,
    path    => $full_path,
    mode    => '0755',
    content => template("${module_name}/batt_check.sh.erb")
  } ->

  cron { 'batt_check':
    ensure  => $ensure,
    command => $full_path,
    minute  => '*/5'
  }

}
