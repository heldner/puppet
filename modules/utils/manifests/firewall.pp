class utils::firewall {

  ensure_packages('iptables-persistent')

  Firewall {
    require => undef,
  }

  firewallchain { 'INPUT:filter:IPv4':
    purge => true,
  }

  firewallchain { 'FORWARD:filter:IPv4':
    purge  => true,
    ignore => [
      '-o docker0',
      '-i docker0'
    ],
  }

  firewallchain { 'POSTROUTING:nat:IPv4':
    purge  => true,
    ignore => [
      'docker0',
    ],
  }

  firewall { '000 snat for LibreJupiter':
    chain       => 'POSTROUTING',
    jump        => 'MASQUERADE',
    proto       => 'all',
    outiface    => 'wlan0',
    destination => '192.168.12.0/24',
    table       => 'nat',
  }
  firewall { '001 snat for LibreJupiter':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => 'eth0',
    source   => '192.168.12.0/24',
    table    => 'nat',
  }

  # Default firewall rules
  firewall { '000 accept icmp pings':
    proto  => 'icmp',
    action => 'accept',
  }

  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  firewall { '002 deny broken packets':
    proto     => 'tcp',
    tcp_flags => [ 'FIN,SYN,RST,PSH,ACK,URG NONE' ],
    action    => 'drop'
  }

  firewall { '003 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }

  firewall { '012 forward':
    proto   => 'all',
    source  => '192.168.12.1/24',
    iniface => 'wlan0',
    action  => 'accept',
    chain   => 'FORWARD',
  }

  firewall { '011 forward':
    proto       => 'all',
    destination => '192.168.12.1/24',
    iniface     => 'eth0',
    action      => 'accept',
    chain       => 'FORWARD',
  }


  firewall { '010 allow ssh':
    proto  => 'tcp',
    port   => 'ssh',
    state  => 'NEW',
    action => 'accept',
  }

  firewall { '011 allow dns':
    proto  => 'tcp',
    port   => '53',
    state  => 'NEW',
    action => 'accept',
  }

  firewall { '012 allow dns':
    proto  => 'udp',
    port   => '53',
    state  => 'NEW',
    action => 'accept',
  }

  firewall { '011 allow dhcp':
    proto  => 'tcp',
    port   => '67',
    state  => 'NEW',
    action => 'accept',
  }

  firewall { '012 allow dhcp':
    proto  => 'udp',
    port   => '67',
    state  => 'NEW',
    action => 'accept',
  }

  firewall { '020 jabber send files':
    proto  => 'tcp',
    port   => '28011',
    state  => 'NEW',
    action => 'accept',
  }

  firewall { '999 drop all other':
    proto  => 'all',
    action => 'drop',
  }

}

