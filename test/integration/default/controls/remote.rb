control 'remote' do
    title 'Remote tests'
    desc 'Performs remote tests to verify the created instances'

    instances_dns = input('webcounter_public_dns')

    instances_dns.each do |dns|
        describe http("http://#{dns}:8000/health") do
            its('status') { should eq 200 }
        end
    end

end