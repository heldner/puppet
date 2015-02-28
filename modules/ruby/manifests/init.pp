class ruby (
  $ensure = 'present'
  ) {

  apt::source { 'ruby':
    ensure   => $ensure,
    location => 'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu',
    release  => 'precise',
    repos    => 'main'
  }
}
