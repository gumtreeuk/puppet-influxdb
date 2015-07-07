class influxdb::config::graphite (
    $bind_address = "2003",
    $consistency_level = "one",
    $enabled = "false",
    $name_separator = ".",
    $protocol = "tcp",
){
    require influxdb::params

    # plugins have extra brackets in heading?
    influxdb::config::section { '[graphite]':
        hash_keyvalues => {
            'bind-address'      => ":${bind_address}",
            'consistency-level' => $consistency_level,
            'enabled'           => $enabled,
            'name-separator'    => $name_separator,
            'protocol'          => $protocol,
        },
        order => 80,
    }
}
