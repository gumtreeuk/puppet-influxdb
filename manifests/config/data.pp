class influxdb::config::data (
    $max_wal_size = "104857600",
    $wal_flush_interval = "10m",
    $wal_partition_flush_delay = "2s",
) {
    require influxdb::params
    $dir = "${influxdb::params::rootdir}/data"

    influxdb::config::section { 'data':
        hash_keyvalues => {
            'dir'                    => $dir,
            'MaxWALSize'             => $max_wal_size,
            'WALFlushInterval'       => $wal_flush_interval,
            'WALPartitionFlushDelay' => $wal_partition_flush_delay,
        },
        order   => 30,
    }
}
