class Source < ActiveRecord::Base
  belongs_to :source_category

  def get_new_items
    feed = get_feed_content
    items = Array.new
    feed.entries.each do |i|
      item = NewsItem.new
      item.source_id = self.id
      item.link = i.url
      item.title = i.title
      item.published_at = i.published
      begin
        item.save!
        items << item
      rescue Exception => e
        next if e.message.match(/item already exists/) or e.message.match(/bad news item/)
      end
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
    begin
    require 'iconv'
    content = Iconv.conv('ASCII//IGNORE', 'UTF8', content)
    rescue
    end
    Feedzirra::Feed.parse(content)
  end
end

