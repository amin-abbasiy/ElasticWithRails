namespace :elastic do
  task create_map: :environment do
    desc "create default mapping"
    puts "Creating Mapping..."
    ::Log.explicit_mapping
    puts "Mapping Finished!"
  end

  task remove_map: :environment do
    desc "delete default mapping"
    puts "Deleting Mapping..."
    ::Log.remove_mapping
    puts "Mapping Deleted!"
  end
end