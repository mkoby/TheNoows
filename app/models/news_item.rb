class NewsItem < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 15

  belongs_to :source
  has_many :votes
  has_many :users, :through => :votes
  validates_presence_of :title, :link, :message => "No title or link, bad news item"
  validates_uniqueness_of :link, :scope => [:source_id], :message => "News item already exists"

  def vote_up(user)
    self.last_clicked_at = Time.now
    self.total_votes += 1
    if self.save
      return create_vote(user)
    end
  end

  def self.is_valid_news_item?(item)
    return false if item.title.match /^Sponsored By/
    return true
  end

  private

    def create_vote(user)
      return Vote.create!(:user => user, :news_item => self) ? true : false
    end

end

