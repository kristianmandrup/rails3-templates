def unzip_it(http_location, zipfile, folder = nil)
  run "curl -O #{http_location}/#{zipfile}"
  
  if folder 
    run "unzip #{zipfile} -d #{folder}" 
  else 
    run "unzip #{zipfile}"    
  end
    
  run "rm #{zipfile}"
end  

def get_file(http_location, file)
  run "curl -L #{http_location}/#{file} > #{file}"
end
