class utils {

  $utils_pkgs = [
    'zathura',
    'gajim',
    'feh',
    'mutt',
    'isync',
    'irssi',
    'irssi-plugin-xmpp',
    'fonts-font-awesome',
    'unclutter'
  ]

  package { $utils_pkgs:
    ensure => 'installed'
  }

}
