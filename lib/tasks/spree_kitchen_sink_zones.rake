namespace :spree_kitchen_sink_zones do
  desc 'Seeds zip codes'
  task :load_zipcodes => :environment do
    SpreeKitchenSinkZones::ZipcodeSeeder.seed
  end
end
