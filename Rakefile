require "rubygems"
require "bundler"
require "rake"
require "fileutils"
require "active_support/inflector"
require 'cli-colorize'

task :default => [:generate]

desc "Generate playgrounds"
task :generate do
  copy_posts
  sanitize_posts
  generate_playgrounds
end

desc "Clean things up (./build, ./_playgrounds, ./_temp and ./tmp)"
task :cleanup do
  delete_playgrounds_dir
  delete_build_dir
  delete_tmp_dir
  delete_temp_dir
end

task :playground do
  generate_playgrounds
end

def generate_playgrounds
  %x{playground #{temp_dir} -d #{playgrounds_dir}}
  if post_count > 0
    puts "#{post_count} #{'playground'.pluralize(post_count)}".green + " generated in ./_playgrounds"
  else
    puts "No playgrounds have been generated.".red
  end
end

def copy_posts
  FileList.new("source/posts/*.md").each do |post|
    copy_post(post)
  end
end

def copy_post(post)
  FileUtils.copy_file post, "#{temp_dir}/#{sanitized_post_filename(post)}"
end

def playgrounds_dir_path
  File.join(File.dirname(__FILE__), "_playgrounds")
end

def playgrounds_dir
  unless File.directory?(playgrounds_dir_path)
    create_playgrounds_dir
  end

  playgrounds_dir_path
end

def create_playgrounds_dir
  FileUtils.mkdir_p("playgrounds")
  puts "Created playgrounds directory..."
end

def temp_dir_path
  File.join(File.dirname(__FILE__), "_temp")
end

def temp_dir
  unless File.directory?(temp_dir_path)
    create_temp_dir
  end

  temp_dir_path
end

def create_temp_dir
  FileUtils.mkdir_p(temp_dir_path)
  puts "Created temporary directory..."
end

def delete_playgrounds_dir
  if File.directory?(playgrounds_dir_path)
    FileUtils.rm_rf(playgrounds_dir)
    puts "./playgrounds directory" + " deleted".red
  end
end

def delete_build_dir
  if File.directory?("build")
    FileUtils.rm_rf("build")
    puts "./build directory" + " deleted".red
  end
end

def delete_temp_dir
  if File.directory?(temp_dir_path)
    FileUtils.rm_rf(temp_dir_path)
    puts "./_temp directory" + " deleted".red
  end
end

def delete_tmp_dir
  if File.directory?("tmp")
    FileUtils.rm_rf("tmp")
    puts "./tmp directory" + " deleted".red
  end
end

def post_filename(post)
  Pathname.new(post).basename.to_s
end

def sanitized_post_filename(post)
  post_filename(post).gsub(/\d{4}-\d{2}-\d{2}-/, '')
end

def post_count
  FileList.new("#{temp_dir_path}/*.md").count
end

def sanitize_posts
  FileList.new("#{temp_dir_path}/*.md").each do |post|
    body = File.read(post)
    File.open(post, "w") {
      |file| file.puts sanitize_post_body(body, post)
    }
  end
end

def sanitize_post_body(body, post)
  sanitized_body = remove_frontmatter(body, post)
  comment_runtime_errors(sanitized_body)
end

def remove_frontmatter(body, post)
  title = post_title(post).titleize
  body.gsub!(/^---(.|\n)*---/, "# " + title)
end

def comment_runtime_errors(body)
  body.gsub!(/(.*)(\/\/.)/, '\2\1')
end

def post_title(post)
  post_filename(post).chomp(post_extension(post))
end

def post_extension(post)
  File.extname(post)
end
