require 'rubygems'
require 'bundler'
require 'rake'

task :default => [:playground]

desc "Regenrate playgrounds"
task :playground do
  print "Regenerating playgrounds..."
  `playground #{File.dirname(__FILE__)}/source/playgrounds/ -d #{File.dirname(__FILE__)}/public/`
end
