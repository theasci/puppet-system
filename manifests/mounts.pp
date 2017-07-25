class system::mounts (
  $config   = undef,
  $sys_schedule = $::system::sys_schedule,
) {
  $defaults = {
    atboot   => true,
    ensure   => 'mounted',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(mount, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::mounts', undef)
    if $hiera_config {
      create_resources(mount, $hiera_config, $defaults)
    }
  }
}
