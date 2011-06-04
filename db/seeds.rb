# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

@top_news_category = Factory(:source_category)
Factory(:source, :source_category_id => @top_news_category.id)
Source.create!(:source_category_id => @top_news_category.id, :name => "Fox News Latest Headlines", :homepage_url => 'http://www.foxnews.com', :rss_url => 'http://feeds.foxnews.com/foxnews/latest')
Source.create!(:source_category_id => @top_news_category.id, :name => "MSNBC Top Headlines", :homepage_url => 'http://www.msnbc.com', :rss_url => 'http://pheedo.msnbc.msn.com/id/3032091/device/rss')
