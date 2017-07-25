class system::sysconfig::keyboard (
  $config   = undef,
  $sys_schedule = undef,
) {
  if $config {
    $keyboard = $config
  }
  else {
    $keyboard = hiera_hash('system::sysconfig::keyboard', undef)
  }
  if $keyboard {
    system::sysconfig::header { 'keyboard':
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'keyboard-keytable':
      file  => 'keyboard',
      var   => 'KEYTABLE',
      val   => $keyboard['keytable'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'keyboard-model':
      file  => 'keyboard',
      var   => 'MODEL',
      val   => $keyboard['model'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'keyboard-layout':
      file  => 'keyboard',
      var   => 'LAYOUT',
      val   => $keyboard['layout'],
      schedule => $sys_schedule,
    }
    system::sysconfig::entry { 'keyboard-keyboardtype':
      file  => 'keyboard',
      var   => 'KEYBOARDTYPE',
      val   => $keyboard['keyboardtype'],
      schedule => $sys_schedule,
    }
  }
}
