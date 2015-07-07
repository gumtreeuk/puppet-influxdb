require 'spec_helper'
describe 'influxdb::config' do
  let :facts do
      { :concat_basedir => '/tmp/concat' }
  end

  context 'the catalog should at the very least compile' do
    it { should compile }
  end

  context 'should contain all config classes' do
    it {
        should contain_class('influxdb::config::admin')
        should contain_class('influxdb::config::cluster')
        should contain_class('influxdb::config::data')
        should contain_class('influxdb::config::graphite')
        should contain_class('influxdb::config::http')
        should contain_class('influxdb::config::meta')
        should contain_class('influxdb::config::retention')
    }
  end

  context 'with defaults for all parameters' do
    it {
        should contain_file('/etc/opt/influxdb/influxdb.conf')
        should contain_concat__fragment('/etc/opt/influxdb/influxdb.conf-root').with(
            { 'content' => 'reporting-disabled = false' },
        )
    }
  end

  context 'with reporting disabled' do
    it {
        should contain_file('/etc/opt/influxdb/influxdb.conf')
        should contain_concat__fragment('/etc/opt/influxdb/influxdb.conf-root').with(
            { 'content' => 'reporting-disabled = false' },
        )
    }
  end

end
