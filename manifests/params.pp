# Class: bind::params
#
class bind::params {

  case $::osfamily {
    'RedHat': {
      $packagenameprefix = 'bind'
      $servicename       = 'named'
      $binduser          = 'root'
      $bindgroup         = 'named'
      $file_hint         = 'named.ca'
      $file_rfc1912      = '/etc/named.rfc1912.zones'
      if versioncmp($::operatingsystemmajrelease, '6') > 0 {
        $service_restart_command = "systemctl reload ${servicename}"
      } else {
        $service_restart_command = "service ${servicename} reload"
      }
    }
    'Debian': {
      $packagenameprefix = 'bind9'
      $servicename       = 'bind9'
      $binduser          = 'bind'
      $bindgroup         = 'bind'
      $file_hint         = '/etc/bind/db.root'
      $file_rfc1912      = '/etc/bind/named.conf.default-zones'
      $service_restart_command = "service ${servicename} reload"
    }
    'Freebsd': {
      $packagenameprefix = 'bind910'
      $servicename       = 'named'
      $binduser          = 'bind'
      $bindgroup         = 'bind'
      $file_hint         = 'named.ca'
      $file_rfc1912      = '/etc/named.rfc1912.zones'
    }
    default: {
      $packagenameprefix = 'bind'
      $servicename       = 'named'
      $binduser          = 'root'
      $bindgroup         = 'named'
      $file_hint         = 'named.ca'
      $file_rfc1912      = '/etc/named.rfc1912.zones'
      $service_restart_command = "service ${servicename} reload"
    }
  }

}

