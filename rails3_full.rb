tdir = "~/rails3-templates"

app_name = ask("What is your application name?")

if yes?("Add RedCloth ?")
  gem 'RedCloth' 
end

if yes?("Add jQuery ?")
  apply "#{tdir}/jquery.rb" 
end

if bdd = yes?("Use BDD ?") 
  apply "#{tdir}/rspec.rb"
  apply "#{tdir}/bdd.rb"
end

if yes?("Add welcome screen ?")
  run "nifty_scaffold Welcome show"
  route "root :to => 'welcome#show'" 
end

if yes?("Add sproutcore app ?")
  apply "#{tdir}/sproutcore.rb"
end