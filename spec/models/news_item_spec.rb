require 'spec_helper'

describe NewsItem do

  it "should not allow duplicates" do
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category_id => @source_category.id)
    @item = Factory(:news_item, :source_id => @source.id)
    expect { NewsItem.create!(:source_id => @source.id, :title => @item.title, :link => @item.link, :description => @item.description, :published_at => @item.published_at) }.to raise_error
  end

#  pending "add some examples to (or delete) #{__FILE__}"
end
