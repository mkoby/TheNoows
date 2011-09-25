# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Top News Category & Items
@top_news_category = SourceCategory.create!(:name => 'Latest News', :description => 'The latest news headlines') unless SourceCategory.find_by_name("Latest News")
Source.create!(:source_category_id => @top_news_category.id, :name => "CNN Top Stories", :homepage_url => 'http://www.cnn.com', :rss_url => 'http://rss.cnn.com/rss/cnn_topstories.rss') unless Source.find_by_name("CNN Top Stories")
Source.create!(:source_category_id => @top_news_category.id, :name => "Fox News Latest Headlines", :homepage_url => 'http://www.foxnews.com', :rss_url => 'http://feeds.foxnews.com/foxnews/latest') unless Source.find_by_name("Fox News Latest Headlines")
Source.create!(:source_category_id => @top_news_category.id, :name => "MSNBC Top Headlines", :homepage_url => 'http://www.msnbc.com', :rss_url => 'http://pheedo.msnbc.msn.com/id/3032091/device/rss') unless Source.find_by_name("MSNBC Top Headlines")

# U.S. News Category & Items
@us_news_category = SourceCategory.create!(:name => 'U.S. News', :description => 'The latest U.S. news headlines') unless SourceCategory.find_by_name("U.S. News")
Source.create!(:source_category_id => @us_news_category.id, :name => "CNN U.S. Stories", :homepage_url => 'http://www.cnn.com/US/', :rss_url => 'http://rss.cnn.com/rss/cnn_us.rss') unless Source.find_by_name("CNN U.S. Stories")
Source.create!(:source_category_id => @us_news_category.id, :name => "Fox News U.S. Stories", :homepage_url => 'http://www.foxnews.com/us/index.html', :rss_url => 'http://feeds.foxnews.com/foxnews/national') unless Source.find_by_name("Fox News U.S. Stories")
Source.create!(:source_category_id => @us_news_category.id, :name => "MSNBC U.S. Stories", :homepage_url => 'http://www.msnbc.msn.com/id/3032525/ns/us_news/', :rss_url => 'http://rss.msnbc.msn.com/id/3032524/device/rss/rss.xml') unless Source.find_by_name("MSNBC U.S. Stories")

# World News Category & Items
@word_news_category = SourceCategory.create!(:name => 'World News', :description => 'The latest World news headlines') unless SourceCategory.find_by_name("World News")
Source.create!(:source_category_id => @word_news_category.id, :name => "CNN World Stories", :homepage_url => 'http://www.cnn.com/WORLD/', :rss_url => 'http://rss.cnn.com/rss/cnn_world.rss') unless Source.find_by_name("CNN World Stories")
Source.create!(:source_category_id => @word_news_category.id, :name => "Fox News World Stories", :homepage_url => 'http://www.foxnews.com/world/index.html', :rss_url => 'http://feeds.foxnews.com/foxnews/world') unless Source.find_by_name("Fox News World Stories")
Source.create!(:source_category_id => @word_news_category.id, :name => "MSNBC World Stories", :homepage_url => 'http://www.msnbc.msn.com/id/3032507/ns/world_news/', :rss_url => 'http://rss.msnbc.msn.com/id/3032506/device/rss/rss.xml') unless Source.find_by_name("MSNBC World Stories")