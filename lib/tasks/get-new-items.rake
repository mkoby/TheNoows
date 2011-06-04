require 'rake'

namespace :noows do
  desc "Grabs latest RSS items from all sources, and creates the news items for display"
  task :get_news_items => :environment do
    puts "Getting sources"
    begin
      sources = Source.all
    rescue Exception => e
      puts "ERROR GRABBING SOURCES"
      puts "MESSAGE: #{e.message}"
      puts "STACKTRACE:"
      puts e.backtrace
    end

    sources.each do |source|
      puts "Getting Items for #{source.name}"
      begin
        items = source.get_new_items
      rescue Exception => e
        puts "ERROR GRABBING NEWS ITEMS"
        puts "SOURCE: #{source.name}"
        puts "ERROR MESSAGE: #{e.message}"
        puts "STACKTRACE:"
        puts e.backtrace
      end
    end

  end
end
