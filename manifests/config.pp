# == Class profile_users::config
#
# This class is called from profile_users for service config.
#
class profile_users::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  accounts::user { $profile_users::users:
    comment => 'Admin User',
#    groups  => [
#      'sudo',
#    ],
#    sshkeys => [
#      'ssh-rsa AAAAB3Nza...== jeff@puppetlabs.com',
#      'ssh-dss AAAAB3Nza...== jeff@metamachine.net',
#    ],
  }

  class { 'sudo':
    purge               => false,
    config_file_replace => false,
  }

  sudo::conf { $profile_users::users:
    priority => 10,
    content  => "%${profile_users::users} ALL=(ALL) NOPASSWD: ALL",
  }
}
