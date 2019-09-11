control 'local' do
    title 'AWS instance local tests'
    desc 'Performs local tests on the AWS instances to verify provisioning'

    describe file('/etc/systemd/system/webcounter.service.d/environment.conf') do
        it { should exist }
        its('content') { should match /\[Service\]\nEnvironment=('|")REDIS_ADDR=#{input('redis_address')}('|") ('|")REDIS_PASS=#{input('redis_password')}('|")/ }
    end

    describe systemd_service('webcounter.service') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

end