# == Class profile_users::config
#
# This class is called from profile_users for service config.
#
class profile_users::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  accounts::user { 'testuser':
    comment => 'Test User',
#    groups  => [
#      'sudo',
#    ],
#    sshkeys => [
#      'ssh-rsa AAAAB3Nza...== jeff@puppetlabs.com',
#      'ssh-dss AAAAB3Nza...== jeff@metamachine.net',
#    ],
  }
}
