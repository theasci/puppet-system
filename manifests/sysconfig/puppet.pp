class system::sysconfig::puppet (
  $config   = undef,
  $sys_schedule = undef,
) {
  if $config {
    $puppet = $config
  }
  else {
    $puppet = hiera_hash('system::sysconfig::puppet', undef)
  }
  if $puppet {
    system::sysconfig::header { 'puppet':
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-server':
      file  => 'puppet',
      var   => 'PUPPET_SERVER',
      val   => $puppet['server'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-port':
      file  => 'puppet',
      var   => 'PUPPET_PORT',
      val   => $puppet['port'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-log':
      file  => 'puppet',
      var   => 'PUPPET_LOG',
      val   => $puppet['log'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-extra_opts':
      file  => 'puppet',
      var   => 'PUPPET_EXTRA_OPTS',
      val   => $puppet['extra_opts'],
      schedule => $sys_schedule,
    }
  }
}
