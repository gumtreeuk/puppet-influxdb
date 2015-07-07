define influxdb::config::section(
    $hash_keyvalues,
    $order = 100,
) {
    require influxdb::params
    concat::fragment{ "${influxdb::params::config_file}-${name}":
        target  => "${influxdb::params::config_file}",
        content => inline_template('
[<%= @name %>]
<% @hash_keyvalues.each_pair do |key, value| -%>
  <%= key %> = "<%= value %>"
<% end -%>
'
        ),
        order   => $order,
    }
}
