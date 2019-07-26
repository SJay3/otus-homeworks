#packer validation

title 'packer validation'

control 'packer' do
  impact 1
  title 'Run packer validate'

  command('find packer/ -name *.json').stdout.split.each do |fname|
    describe command('packer validate -var-file=packer/variables.json.example #{fname}') do
      its('stdout') { should eq "Template validated successfully.\n" }
      its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
    end
  end
end
