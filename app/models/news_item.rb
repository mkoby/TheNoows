class NewsItem < ActiveRecord::Base
  belongs_to :source
  validates_presence_of :title, :link, :message => "No title or link, bad news item"
  validates_uniqueness_of :title, :scope => [:link, :published_at], :message => "News item already exists"
end
