require 'rake'

OLDER_THAN = 2 #sets the number of weeks back, anything over this limit gets deleted

namespace :noows do
  desc "Removes all news items that are older than #{OLDER_THAN} weeks and have ZERO votes"
  task :remove_old_items => :environment do
    items = NewsItem.where("created_at < ? AND total_votes = 0", Time.now - OLDER_THAN.weeks)
    items_deleted = 0
    items.each do |item|
      item.delete and items_deleted += 1 if item.votes.count == 0
    end
    puts "Items Deleted: #{items_deleted}"
  end
end
