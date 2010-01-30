tdir = "~/rails3-templates"

apply "#{tdir}/helper_functions"

inside "public/javascripts/jquery" do
  # install JQuery  
  get_file "http://code.jquery.com", "jquery-1.4.1.min.js"

  # jquery Form
  if yes?("Add jQuery Form ?")
    get_file "http://jquery.malsup.com/form", "jquery.form.js"
  end

  # jquery grid
  if yes?("Add jQuery grid ?")
    run "git clone git://github.com/tonytomov/jqGrid.git jquery-grid"
    # rm .git
    inside "jquery-grid" do    
      run "rm -rf .git*"
    end
  end

  if yes?("Add jQuery jsTree ?")
    unzip_it "http://jstree.googlecode.com/files", "1.0beta2.zip", "jstree"
  end

  # jquery tree
  if yes?("Add jQuery TreeView ?")
    unzip_it "http://jquery.bassistance.de/treeview", "jquery.treeview.zip"
  end

  if yes?("Add jQuery Autocomplete ?")
    unzip_it "http://jquery.bassistance.de/autocomplete", "jquery.autocomplete.zip"
  end

end