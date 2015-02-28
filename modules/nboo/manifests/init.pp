class nboo {

  include nboo::battery

  apt::conf { 'suggests':
    content  => 'APT::Install-Suggests "false";',
    priority => 02
  }

  apt::conf { 'autoremove':
    content => 'APT::Get::AutomaticRemove "true";',
  }

  $x_pkgs = [
    'xserver-xorg-video-intel',
    'xserver-xorg-input-synaptics',
  ]

  package { $x_pkgs:
    ensure  => 'installed',
  }

}
