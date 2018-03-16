# == Class profile_users::install
#
# This class is called from profile_users for install.
#
class profile_users::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

}
