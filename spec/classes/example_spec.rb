require 'spec_helper'

describe 'profile_users' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo",
            :monitor_address => "localhost"
          })
        end

        context "profile_users class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('profile_users') }
          it { is_expected.to contain_class('profile_users::params') }

          it { is_expected.to contain_class('profile_users::install') }
          it { is_expected.to contain_class('profile_users::config') }
          it { is_expected.to contain_class('profile_users::service') }

          case facts[:operatingsystem]
          when 'Debian'
            it { is_expected.to contain_accounts__user('debian') }
            it { is_expected.to contain_sudo__conf('debian') }
          when 'Ubuntu'
            it { is_expected.to contain_accounts__user('ubuntu') }
            it { is_expected.to contain_sudo__conf('ubuntu') }
          else
          # expect to fail
          end
        end
      end
    end
  end
end
