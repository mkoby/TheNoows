require 'spec_helper'

describe NewsItemController do
  before(:each) do
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category_id => @source_category.id)
    @source.rss_url = File.dirname(__FILE__) + "/../files/cnn_topstories.rss"
    @source.save
    @items = @source.get_new_items
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
    before(:each) do
      get 'vote_up', :id => @items.first.id
      @clicked_item = assigns(:item)
    end

    it "should change last_clicked_at" do
      @clicked_item.last_clicked_at.should be_within(10.seconds).of(Time.now)
    end

    it "should have a vote_count of 1" do
      @clicked_item.total_votes.should == 1
    end

  end

end

