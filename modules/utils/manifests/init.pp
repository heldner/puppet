class utils {

  $utils_pkgs = [
    'zathura',
    'gajim',
    'feh',
    'mutt',
  ]

  package { $utils_pkgs:
    ensure => 'installed'
  }

}
