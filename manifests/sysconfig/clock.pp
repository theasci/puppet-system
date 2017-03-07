class system::sysconfig::clock (
  $config   = undef,
  $sys_schedule = undef,
) {
  if $config {
    $clock = $config
  }
  else {
    $clock = hiera_hash('system::sysconfig::clock', undef)
  }
  if $clock {
    $timezone = $clock['timezone']
    system::sysconfig::header { 'clock':
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'clock-zone':
      file     => 'clock',
      var      => 'ZONE',
      val      => $timezone,
      nudge    => Exec['/etc/localtime'],
      schedule => $sys_schedule,
    }
    exec { '/etc/localtime':
      command     => "/bin/rm -f /etc/localtime && /bin/cp /usr/share/zoneinfo/${timezone} /etc/localtime",
      refreshonly => true,
      schedule    => $sys_schedule,
    }
  }
}
