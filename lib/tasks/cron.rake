task :cron => :environment do
  Rake::Task['noows:get_news_items'].invoke
end
