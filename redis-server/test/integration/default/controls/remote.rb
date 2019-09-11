control 'remote' do
    title 'Remote tests'
    desc 'Performs remote tests to verify the created instances'

    describe host(input('redis_public_dns'), port: 6379, protocol: 'tcp') do
        it { should be_reachable }
    end

end