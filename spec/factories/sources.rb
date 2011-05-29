Factory.define :source do |s|
  s.name 'CNN Top Stories'
  s.homepage_url 'http://www.cnn.com'
  s.rss_url 'http://rss.cnn.com/rss/cnn_topstories.rss'
  s.item_link_field 'link'
  s.item_title_field 'title'
  s.item_description_field 'description'
end
