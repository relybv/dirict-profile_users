# == Class: profile_users
#
# Full description of class profile_users here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class profile_users
(
  $admin_key = $::profile_users::params::admin_key,
) inherits ::profile_users::params {

  # validate parameters here

  class { '::profile_users::install': }
  -> class { '::profile_users::config': }
  ~> class { '::profile_users::service': }
  -> Class[ '::profile_users']
}
