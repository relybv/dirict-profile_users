# == Class profile_users::params
#
# This class is meant to be called from profile_users.
# It sets variables according to platform.
#
class profile_users::params {
  case $::operatingsystem {
    'Debian': {
      $users = 'debian'
    }
    'Ubuntu': {
      $users = 'ubuntu'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
