class Source < ActiveRecord::Base
  belongs_to :source_category

  def get_new_items
    #feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")
    feed = get_feed_content
    items = Array.new
    feed.entries.each do |i|
      item = NewsItem.new
      item.link = i.entry_id
      item.title = i.title
      item.description = i.summary
      item.published_at = i.published
      item.save!
      items << item
    end
    return items
  end

  private

  def get_feed_content()
    content = String.new
    if self.rss_url[0,4] == "http"
      content = Feedzirra::Feed.fetch_raw(self.rss_url)
    else
      content = open(self.rss_url).read
    end

    #Clean feed content removing non-ASCII characters
    require 'iconv'
    content = Iconv.conv('ASCII//IGNORE', 'UTF8', content)
    Feedzirra::Feed.parse(content)
  end
end
