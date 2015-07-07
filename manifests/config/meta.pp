class influxdb::config::meta (
    $bind_address = "8088",
    $commit_timeout = "50ms",
    $election_timeout = "1s",
    $heartbeat_timeout = "1s",
    $leader_lease_timeout = "500ms",
    $retention_autocreate = "true",
){
    require influxdb::params

    $dir = "${influxdb::params::rootdir}/meta"

    influxdb::config::section { 'meta':
        hash_keyvalues             => {
            'bind-address'         => ":${bind_address}",
            'commit-timeout'       => $commit_timeout,
            'dir'                  => $dir,
            'election-timeout'     => $election_timeout,
            'heartbeat-timeout'    => $heartbeat_timeout,
            'leader-lease-timeout' => $leader_lease_timeout,
            'retention-autocreate' => $retention_autocreate,
        },
        order   => 20,
    }
}


