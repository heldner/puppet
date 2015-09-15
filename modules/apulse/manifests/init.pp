class apulse (
  $ensure   = 'present',
  $version  = '0.1.0-2'
  ) {

  validate_re($ensure, ['absent', 'present',])

  $package = "${module_name}_${version}_i386.deb"
  $pkg_path = "/var/cache/apt/archives/${package}"

  include apulse::askype

  file { 'apluse.deb':
    ensure => $ensure,
    path   => $pkg_path,
    source => "puppet:///modules/${module_name}/${package}"
  } ->

  package { 'apulse':
    ensure   => $ensure,
    source   => $pkg_path,
    provider => 'dpkg',
  }

}
