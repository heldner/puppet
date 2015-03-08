class utils {

  $utils_pkgs = [
    'zathura',
    'gajim',
    'feh',
    'mutt',
    'isync',
    'irssi',
    'irssi-plugin-xmpp',
  ]

  package { $utils_pkgs:
    ensure => 'installed'
  }

}
