class influxdb (
    $manage_package = true,
    $manage_service = true,
){
    include influxdb::config

    if $manage_package {
        include influxdb::install
    }

    if $manage_service {
        if $lsbdistid == "Debian" {
            service { 'influxdb':
                ensure   => running,
                provider => $lsbdistmajrelease ? {
                    "8"     => "systemd",
                    default => "service",
                },
            }
        }
    }

}
