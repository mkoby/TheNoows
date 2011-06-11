require 'spec_helper'

describe NewsItemController do
  before(:each) do
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category_id => @source_category.id)
    @source.rss_url = File.dirname(__FILE__) + "/../files/cnn_topstories.rss"
    @source.save
    @source.get_new_items
  end

  describe "GET 'list'" do
    before(:each) do
      get 'list'
    end

    it "should be successful" do
      response.should be_success
    end

    it "should return a list of news_items" do
      items = assigns(:items)
      items.should_not be_nil
    end
  end

  describe "GET 'vote_up'" do
  end

end
