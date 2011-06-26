class User < ActiveRecord::Base
  acts_as_authentic do |c|
  end

  has_many :votes
  has_many :news_items, :through => :votes

  def self.new_from_facebook(access_token, fb_data)
    self.new(
      :email => fb_data.email,
      :first_name => fb_data.first_name,
      :last_name => fb_data.last_name,
      :facebook_id => fb_data.id,
      :facebook_access_token => access_token
    )
  end
end

