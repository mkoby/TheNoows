require 'spec_helper'

describe HomepageController do
  before(:each) do
    activate_authlogic
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category_id => @source_category.id)
    @source.rss_url = File.dirname(__FILE__) + "/../files/cnn_topstories.rss"
    @source.save
    @user = Factory(:user)
    @items = @source.get_new_items
  end

  describe "GET 'list'" do
    before(:each) do
      get 'home'
    end

    it "should be successful" do
      response.should be_success
    end

    it "should return a list of news_items" do
      items = assigns(:items)
      items.should_not be_nil
    end
  end
end
