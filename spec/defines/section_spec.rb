require 'spec_helper'
describe 'influxdb::config::section' do
  let :facts do
      { :concat_basedir => '/tmp/concat' }
  end

  let (:title) { 'foobar' }
  let (:params) {
    {
      :order => 999,
      :hash_keyvalues => {
        'foo' => 'bar',
        'baz' => 'boz'
      }
    }
  }

  context 'params class should be present' do
    it { should contain_class('influxdb::params') }
  end

  context 'config fragment should be present' do
    it {
      should contain_concat__fragment('/etc/opt/influxdb/influxdb.conf-foobar')
    }
  end

  context 'fragment should have correct content' do
    it {
      should contain_concat__fragment('/etc/opt/influxdb/influxdb.conf-foobar').with({
        'order'   => 999,
        'target'  => '/etc/opt/influxdb/influxdb.conf',
        'content' => '
[foobar]
  foo = "bar"
  baz = "boz"
',
      })
    }
  end
end

# vim: set ts=2 sw=2 et
