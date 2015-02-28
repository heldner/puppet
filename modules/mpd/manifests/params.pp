class mpd::params {

  $ensure    = pick($ensure, 'present')
  $music_dir = pick($music_dir, '/var/lib/mpd')
  $use_pulse = pick($use_pulse, false)

}
