class influxdb::config::retention (
    $check_interval = "10m",
    $enabled = "true",
) {
    influxdb::config::section { 'retention':
        hash_keyvalues => {
            'check-interval' => $check_interval,
            'enabled'        => $enabled,
        },
        order   => 50,
    }
}
