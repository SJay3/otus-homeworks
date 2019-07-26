#ansible validation

title 'ansible validation'

control 'ansible' do
  impact 1
  title 'Run ansible validation'

  command('cd ansible && find playbooks/ -name "*.yml" -type f').stdout.split.each do |fname|
  	describe command("cd ansible && ansible-lint #{fname} --exclude=roles/jdauphant.nginx") do
      its('stdout') { should eq '' }
      its('exit_status') { should eq 0 }
  	end
  end

end
