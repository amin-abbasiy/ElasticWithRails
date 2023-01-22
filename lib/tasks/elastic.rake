namespace :elastic do
  task create_map: :environment do
    desc "create default mapping"
    puts "Creating Mapping..."
    ::Log.explicit_mapping
    puts "Mapping Finished!"
  end
end