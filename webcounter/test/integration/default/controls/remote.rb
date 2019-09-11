control 'remote' do
    title 'Remote tests'
    desc 'Performs remote tests to verify the created instances'

    instances_dns = input('webcounter_public_dns')
    instances_ips = input('webcounter_public_ips')

    instances_dns.each_index do |i|
        describe host(instances_dns[i], port: 8000, protocol: 'tcp') do
            it { should be_reachable }
            it { should be_resolvable }
            its('ipaddress') { should include instances_ips[i] }
        end
    end

end