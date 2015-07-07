#influxdb

####Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with influxdb](#beginning-with-influxdb)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

##Description

A simple module to configure [influxdb](https://influxdb.com/). Only supports Debian at present, but could work on other OS's with minor additions.

##Setup

###Setup Requirements

concat - The [puppetlabs concat](https://forge.puppetlabs.com/puppetlabs/concat) module is used to assemble configuration files.

###Beginning with influxdb

Doing a simple "include influxdb" will configure influxdb with the default config values as at 0.9.1.

##Usage

Set configuration parameters in hiera. See manifests/config.pp and manifests/config for the parameters that can be set.

e.g:

    influxdb::config::meta::bind_address: "8088"

##Reference

###Classes

####Public Classes
* [`influxdb`](#class-influxdb): Installs and configures influxdb

####Private Classes
* [`influxdb::config`]: Builds the influxdb configuration file
* [`influxdb::install`]: Installs the influxdb package
* [`influxdb::params`]: Static parameters
* [`influxdb::config::admin`]: Builds the admin section of the config
* [`influxdb::config::cluster`]: Builds the cluster section of the config
* [`influxdb::config::data`]: Builds the data section of the config
* [`influxdb::config::graphite`]: Builds the graphite section of the config
* [`influxdb::config::http`]: Builds the http section of the config
* [`influxdb::config::meta`]: Builds the meta section of the config
* [`influxdb::config::retention`]: Builds the retention section of the config
* [`influxdb::config::section`]: Type to build a section of the config file

###Class: `influxdb`

####Parameters

#####`manage_package`
Whether or not to manage the package. Valid options: true or false. Default: true.

#####`manage_service`
Whether or not to manage the influxdb service and ensure it is running. Default: true.

##Limitations

Supports Debian wheezy and jessie only.

##Development

This module is fairly basic at present, but pull requests are welcome.

##Contributors

Alex Forbes, alforbes@gumtree.com
