# rotate backgound with cron
# require feh package

class xorg::background (
  $pic_path,
  $user
  ) {

  cron { 'bg rotate':
    command     => 'feh -z --no-fehbg --bg-center ~/pictures/backgrounds',
    hour        => '*',
    minute      => 0,
    environment => 'DISPLAY=:0.0',
    user        => $user
  }

}
