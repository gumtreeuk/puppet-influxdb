require 'spec_helper'

describe 'influxdb', :type => 'class' do

    context "On a Debian wheezy OS with package management" do
        let :facts do
            {
                :lsbdistid => 'Debian',
                :lsbdistmajrelease => '7',
                :concat_basedir => '/tmp/concat'
            }
        end

        it {
            should contain_package('influxdb').with(
                { 'name' => 'influxdb' }
            )
            should contain_service('influxdb').with(
                { 'name' => 'influxdb' },
                { 'provider' => 'service' },
            )
        }
    end

    context "On a Debian jessie OS with package management" do
        let :facts do
            {
                :lsbdistid => 'Debian',
                :lsbdistmajrelease => '8',
                :concat_basedir => '/tmp/concat'
            }
        end

        it {
            should contain_package('influxdb').with(
                { 'name' => 'influxdb' },
            )
            should contain_service('influxdb').with(
                { 'name' => 'influxdb' },
                { 'provider' => 'systemd' },
            )
        }
    end
end
