task :cron => :environment do
  start_time = 20.minutes.from_now
  end_time = start_time + 1.day

  while start_time < end_time
    Rake::Task['noows:get_news_items'].delay({:run_at => start_time}).invoke
    start_time += 20.minutes
  end
  
end
