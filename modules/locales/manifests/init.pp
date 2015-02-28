class locales {

  $locales = [
    'en_US.UTF-8 UTF-8',
    'ru_RU.UTF-8 UTF-8'
  ]

  package { 'locales':
    ensure => 'installed'
  } ->

  file { 'locale.gen':
    ensure  => 'present',
    path    => '/etc/locale.gen',
    content => template("${module_name}/locale.gen.erb")
  } ->

  exec { 'locale gen':
    command     => '/usr/sbin/locale-gen',
    refreshonly => true,
    subscribe   => File['locale.gen']
  }

}
