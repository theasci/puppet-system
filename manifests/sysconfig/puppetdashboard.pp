class system::sysconfig::puppetdashboard (
  $config   = undef,
  $sys_schedule = undef,
) {
  if $config {
    $puppetdashboard = $config
  }
  else {
    $puppetdashboard = hiera_hash('system::sysconfig::puppetdashboard', undef)
  }
  if $puppetdashboard {
    system::sysconfig::header { 'puppet-dashboard':
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-home':
      file  => 'puppet-dashboard',
      var   => 'DASHBOARD_HOME',
      val   => $puppetdashboard['home'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-user':
      file  => 'puppet-dashboard',
      var   => 'DASHBOARD_USER',
      val   => $puppetdashboard['user'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-ruby':
      file  => 'puppet-dashboard',
      var   => 'DASHBOARD_RUBY',
      val   => $puppetdashboard['ruby'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-environment':
      file  => 'puppet-dashboard',
      var   => 'DASHBOARD_ENVIRONMENT',
      val   => $puppetdashboard['environment'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-iface':
      file  => 'puppet-dashboard',
      var   => 'DASHBOARD_IFACE',
      val   => $puppetdashboard['iface'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-port':
      file  => 'puppet-dashboard',
      var   => 'DASHBOARD_PORT',
      val   => $puppetdashboard['port'],
      schedule => $sys_schedule,
    }
  }
}
