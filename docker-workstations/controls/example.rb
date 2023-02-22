# copyright: 2018, The Authors

describe yaml('file_name') do
  its('setting') { should_not eq 'value' }
end

describe yaml('resources/docker-compose.yml') do
  its(['services', 'workstation', 'image']) { should eq 'learnchef/inspec_workstation' }
  its(['services', 'workstation', 'volumes']) { should cmp '.:/root' }
end

describe yaml('/workspaces/saf-training-lab-environment/resources/docker-compose.yml') do
  its(['services', 'workstation', 'image']) { should eq 'learnchef/inspec_workstation' }
  its(['services', 'workstation', 'volumes']) { should cmp '.:/root' }
end

describe docker_compose_config('/workspaces/saf-training-lab-environment/resources/docker-compose.yml') do
  its('services.workstation.image') { should eq 'learnchef/inspec_workstation' }
  its('services.workstation.volumes') { should cmp '.:/root' }
end