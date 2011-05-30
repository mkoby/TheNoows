class NewsItem < ActiveRecord::Base
  validates_uniqueness_of [:title, :link, :published_at], :message => "News item already exists"
end
