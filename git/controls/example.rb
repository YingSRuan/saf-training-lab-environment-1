git_dir = "/workspaces/saf-training-lab-environment/git_test/.git"

# The following banches should exist
describe command("git --git-dir #{git_dir} branch") do
  its('stdout') { should match /master/ }
end

describe command("git --git-dir #{git_dir} branch") do
  its('stdout') { should match /testBranch/ }
end

# The following banches should exist
describe git(git_dir) do
  its('branches') { should include 'master' }
  its('branches') { should include 'testBranch' }
  its('current_branch') { should cmp 'master' }
end

# What is the current branch
describe command("git --git-dir #{git_dir} branch") do
  its('stdout') { should match /^\* master/ }
end

# What is the latest commit
describe command("git --git-dir #{git_dir} log -1 --pretty=format:'%h'") do
  its('stdout') { should match /edc207f/ }
end

describe git(git_dir) do
  its('latest_commit') { should match /edc207f/  } 
end

# What is the second to last commit
describe command("git --git-dir #{git_dir} log --skip=1 -1 --pretty=format:'%h'") do
  its('stdout') { should match /8c30bff/ }
end

describe git(git_dir) do
  its('sec_latest_commit') { should match /8c30bff/  } 
end