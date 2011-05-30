class NewsItem < ActiveRecord::Base
  validates_uniqueness_of :title, :scope => [:link, :published_at], :message => "News item already exists"
end
