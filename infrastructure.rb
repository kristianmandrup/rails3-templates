# generate Cucumber infrastructure
gem bundle
if bdd
  generate 'rspec'
  generate 'cucumber'
END