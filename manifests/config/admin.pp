class influxdb::config::admin (
    $bind_address = "8083",
    $enabled = "true",
){
    influxdb::config::section { 'admin':
        hash_keyvalues     => {
            'bind-address' => ":${bind_address}",
            'enabled'      => $enabled,
        },
        order   => 60,
    }
}
