route "map.root :controller => :person"

lib_name = ask("What do you want to call the shiny library ?")
lib_name << ".rb" unless lib_name.index(".rb")

lib lib_name, <<-CODE
class Shiny
end
CODE

rake("rails:freeze:gems") if yes?("Freeze rails gems ?")

git :init
git :add => "."
git :commit => "-a -m 'Initial commit'"

gem 'mislav-will_paginate', :version => '~> 2.2.3', 
  :lib => 'will_paginate',  :source => 'http://gems.github.com'
gem 'rubyist-aasm'
gem 'ruby-openid'
 
rake("gems:install", :sudo => true)

generate("authenticated", "user session")
generate("rspec")

file 'app/views/layouts/application.html.erb', <<-ERB
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Application!</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js" type="text/javascript"></script>
<%= stylesheet_link_tag 'global' %>
</head>
<body>
<%= yield %>
</body>
</html>
ERB

# require gems
gem 'cucumber'
gem 'webrat'
 
# generate Cucumber infrastructure
run './script/generate cucumber'

