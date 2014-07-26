def root_dir
  File.dirname(File.dirname(__FILE__))
end

def playgrounds_dir_path
  File.join(root_dir, "_playgrounds")
end

def playgrounds_dir
  unless File.directory?(playgrounds_dir_path)
    create_playgrounds_dir
  end

  playgrounds_dir_path
end

def create_playgrounds_dir
  FileUtils.mkdir_p("_playgrounds")
end

def temp_dir_path
  File.join(root_dir, "_temp")
end

def temp_dir
  unless File.directory?(temp_dir_path)
    create_temp_dir
  end

  temp_dir_path
end

def create_temp_dir
  FileUtils.mkdir_p(temp_dir_path)
end

def delete_playgrounds_dir
  if File.directory?(playgrounds_dir_path)
    FileUtils.rm_rf(playgrounds_dir)
    puts "/_playgrounds directory" + " deleted".red
  end
end

def delete_temp_dir
  if File.directory?(temp_dir_path)
    FileUtils.rm_rf(temp_dir_path)
  end
end

def delete_tmp_dir
  if File.directory?("tmp")
    FileUtils.rm_rf("tmp")
    puts "./tmp directory" + " deleted".red
  end
end
