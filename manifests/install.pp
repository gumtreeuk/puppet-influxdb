class influxdb::install {
    package { 'influxdb':
        ensure => installed
    }
}
