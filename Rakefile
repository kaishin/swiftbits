require 'rubygems'
require 'bundler'
require 'rake'

Dir["lib/tasks/*"].each do |task|
  require_relative task
end

task :default => [:open]
