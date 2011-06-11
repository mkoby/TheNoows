Factory.define :news_item do |i|
  i.title 'News Item Title'
  i.link 'http://www.newsitemlink.com'
#  i.description 'News Item Description of what the news item is about'
  i.published_at Time.now
end
