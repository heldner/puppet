class udev::reload_rules {
  exec { 'udev_reload':
    command     => 'udevadm control --reload-rules',
    path        => '/sbin',
    refreshonly => true,
  }
}
