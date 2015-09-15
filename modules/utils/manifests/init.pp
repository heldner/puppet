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
    'inotify-tools',
    'unclutter'
  ]

  $purged = [
    'avahi-daemon'
  ]

  package { $utils_pkgs:
    ensure => 'installed'
  }

  package { $purged:
    ensure => 'absent'
  }
}
