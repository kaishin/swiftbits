def post_count
  FileList.new("source/posts/*.md").count
end

def playground_count
  FileList.new("#{playgrounds_dir}/*.playground").count
end

def generated_playgrounds_summary
  unless !playground_count
    puts "#{playground_count} #{'playground'.pluralize(playground_count)}".green + " generated in ./#{Pathname.new(playgrounds_dir).basename}."
  end
end
