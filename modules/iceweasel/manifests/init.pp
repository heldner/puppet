class iceweasel (
  $ensure = 'present',
  ) {

  $package_ensure = $ensure ? {
    'present' => 'latest',
    'absetnt' => 'absent',
    default   => 'present'
  }

  apt::source { 'mozilla':
    ensure   => $ensure,
    location => 'http://mozilla.debian.net/',
    release  => 'wheezy-backports',
    repos    => 'iceweasel-release',
  } ->

  apt::pin { 'iceweasel':
    packages => 'iceweasel',
    priority => 1000,
    release  => 'wheezy-backports',
  } ->

  package { 'iceweasel':
    ensure => $package_ensure
  }

}
