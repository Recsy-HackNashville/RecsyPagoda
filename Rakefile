require 'rubygems'
require 'bundler'
require 'rake'
require 'rake/testtask'
require 'rake/task'
require 'rdoc/task'
require 'tasks/rails'

Bundler.setup

Dir["tasks/*.rake"].sort.each { |ext| load ext }

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
