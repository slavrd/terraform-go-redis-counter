control 'local' do
    title 'AWS instance local tests'
    desc 'Performs local tests on the AWS instances to verify provisioning'

    describe file('/etc/redis/redis.conf') do
        it { should exist }
        its('content') { should match /^requirepass #{Regexp.escape(input('redis_password'))}$/ }
        its('group') { should eq 'redis'}
        its('owner') { should eq 'redis'}
    end

    describe systemd_service('redis.service') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

end