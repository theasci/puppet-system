class system::limits (
  $config   = undef,
  $sys_schedule = $::system::sys_schedule,
) {
  if $config {
    include limits
    class { '::limits':
      config    => $config,
      use_hiera => false,
      #schedule => $sys_schedule,
    }
  }
  else {
    $hiera_config = hiera_hash('system::limits', undef)
    if $hiera_config {
      include limits
      class { '::limits':
        config    => $hiera_config,
        use_hiera => false,
        #schedule => $sys_schedule,
      }
    }
  }
}
