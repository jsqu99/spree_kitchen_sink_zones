require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default => [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_kitchen_sink_zones'
  Rake::Task['extension:test_app'].invoke
end

namespace :db do
  desc "Load Zip Codes"
  task :load_zipcodes do
    rails runner "db/default/zipcodes.rb"
  end
end
