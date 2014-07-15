require "rubygems"
require "bundler"
require "rake"
require "fileutils"
require "active_support/inflector"
require "cli-colorize"

FileList.new("./lib/**/*.rb").each { |file| require file }

task :default => ["generate"]

desc "Generate playgrounds"
task :generate do
  prepare_posts
  generate_playgrounds
  generated_playgrounds_summary
  delete_temp_dir
end

desc "Clean things up (./build, ./_playgrounds, ./_temp and ./tmp)"
task :cleanup do
  puts "Cleaning up...".blue
  delete_playgrounds_dir
  delete_build_dir
  delete_tmp_dir
  delete_temp_dir
end
