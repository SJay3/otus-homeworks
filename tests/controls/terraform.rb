# terraform validation

title 'terraform validation'

control 'terraform' do
  impact 1
  title 'Run terraform validation for stage & prod'

  describe command('cd terraform/prod && terraform init -backend=false && terraform validate -var-file=terraform.tfvars.example') do
    its('stdout') { should match "Terraform has been successfully initialized!" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('cd terraform/prod && tflint --var-file=terraform.tfvars.example --error-with-issues') do
    its('stdout') { should match "Your code is following the best practices" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('cd terraform/stage && terraform init -backend=false && terraform validate -var-file=terraform.tfvars.example') do
    its('stdout') { should match "Terraform has been successfully initialized!" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('cd terraform/stage && tflint --var-file=terraform.tfvars.example --error-with-issues') do
    its('stdout') { should match "Your code is following the best practices" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

end
