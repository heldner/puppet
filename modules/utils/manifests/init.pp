class utils {

  $utils_pkgs = [
    'autossh',
    'zathura',
    'gajim',
    'gifsicle',
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
