class system::sysconfig::selinux (
  $config   = undef,
  $sys_schedule = undef,
) {
  if $config {
    $selinux = $config
  }
  else {
    $selinux = hiera_hash('system::sysconfig::selinux', undef)
  }
  if $selinux {
    system::sysconfig::header { 'selinux':
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'selinux-state':
      file     => 'selinux',
      var      => 'SELINUX',
      val      => $selinux['state'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'selinux-type':
      file     => 'selinux',
      var      => 'SELINUXTYPE',
      val      => $selinux['type'],
      schedule => $sys_schedule,
    }
  }
}
