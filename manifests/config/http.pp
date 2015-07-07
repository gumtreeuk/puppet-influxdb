class influxdb::config::http (
    $auth_enabled = "false",
    $bind_address = "8086",
    $enabled = "true",
    $log_enabled = "true",
    $pprof_eabled = "false",
    $write_tracing = "false",
) {
    require influxdb::params

    influxdb::config::section { 'http':
        hash_keyvalues      => {
            'auth-enabled'  => $auth_enabled,
            'bind-address'  => ":$bind_address",
            'enabled'       => $enabled,
            'log-enabled'   => $log_enabled,
            'pprof-eabled'  => $pprof_enabled,
            'write-tracing' => $write_tracing,
        },
        order => 70,
    }
}
