class influxdb::config::cluster (
    $shard_writer_timeout = "5s",
) {
    influxdb::config::section { 'cluster':
        hash_keyvalues => {
            'shard-writer-timeout' => $shard_writer_timeout
        },
        order   => 40,
    }
}
