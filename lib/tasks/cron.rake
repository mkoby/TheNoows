task :cron => :environment do
  start_time = 20.minutes.from_now
  end_time = start_time + 1.day

  while start_time < end_time
    Source.delay({:run_at => start_time}).get_new_items_for_all_sources
    start_time += 20.minutes
  end
  
end
