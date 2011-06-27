class NewsItem < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 25

  belongs_to :source
  has_many :votes
  has_many :users, :through => :votes
  validates_presence_of :title, :link, :message => "No title or link, bad news item"
  validates_uniqueness_of :title, :scope => [:source, :link], :message => "News item already exists"

  def vote_up(user)
    self.last_clicked_at = Time.now
    self.total_votes += 1
    if self.save
      if Vote.create!(:user => user, :news_item => self)
        return true
      end
    end
    return false
  end
end

