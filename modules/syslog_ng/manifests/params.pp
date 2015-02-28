class syslog_ng::params {

  $ensure       = 'present'
  $config_path  = '/etc/syslog-ng/syslog-ng.conf'

  case $::operatingsystem {
    Debian: {
      $package_name = 'syslog-ng'
    }
    defaut: { warning('Could not find syslog') }
  }
}
