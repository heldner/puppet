class xorg (
  $xorg_conf = undef
  ) {

  $x_pkgs = [
    'xserver-xorg',
    'xserver-xorg-core',
    'x11-xserver-utils',
    'slim',
    'xscreensaver',
  ]

  package { $x_pkgs:
    ensure => 'installed'
  }

  if $xorg_conf != undef {
    file { 'xorg.conf':
      ensure  => 'present',
      path    => '/etc/X11/xorg.conf',
      mode    => '0644',
      source  => $xorg_conf,
      require => Package[$x_pkgs]
    }
  }

}
