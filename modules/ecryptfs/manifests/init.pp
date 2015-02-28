class ecryptfs {

  $pkgs = [
    'cryptsetup',
    'ecryptfs-utils'
  ]

  package { $pkgs:
    ensure => 'installed'
  }

}
