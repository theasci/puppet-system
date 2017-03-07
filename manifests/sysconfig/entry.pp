define system::sysconfig::entry (
  $file,
  $var,
  $val,
  $nudge = [],
  $sys_schedule = undef,
) {
  if $val {
    augeas { "system-sysconfig-${file}-${var}":
      context  => "/files/etc/sysconfig/${file}",
      changes  => "set ${var} \"${val}\"",
      notify   => $nudge,
      schedule => $sys_schedule,
    }
  }
}
