require 'spec_helper'
describe 'influxdb' do

  context 'with defaults for all parameters' do
    let :facts do
        {
            :concat_basedir => '/tmp/concat'
        }
    end

    it { should contain_class('influxdb') }
  end
end
