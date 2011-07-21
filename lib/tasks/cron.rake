task :cron => :environment do
  
  if Time.now.hour == 1 #1am every morning.
    Rake::Task['noows:remove_old_items'].invoke
  end
  
  #Run the below task regardless of hour
  Rake::Task['noows:get_news_items'].invoke
end
