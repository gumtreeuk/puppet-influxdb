# Influx DB configuration
#
# Config written for v0.9.1

class influxdb::config (
    $reporting_disabled = "false",
){
    include influxdb::config::admin
    include influxdb::config::cluster
    include influxdb::config::data
    include influxdb::config::graphite
    include influxdb::config::http
    include influxdb::config::meta
    include influxdb::config::retention

    require influxdb::params

    concat { "${influxdb::params::config_file}":
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
    }

    concat::fragment{ "${influxdb::params::config_file}-head":
        target  => "${influxdb::params::config_file}",
        content => "# This file is managed by puppet\n",
        order   => 1,
    }

    concat::fragment{ "${influxdb::params::config_file}-root":
        target  => "${influxdb::params::config_file}",
        content => "reporting-disabled = ${reporting_disabled}",
        order   => 2,
    }
}
