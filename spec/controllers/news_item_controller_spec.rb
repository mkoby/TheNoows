require 'spec_helper'

describe NewsItemController do
  before(:each) do
    activate_authlogic
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category_id => @source_category.id)
    @source.rss_url = File.dirname(__FILE__) + "/../files/cnn_topstories.rss"
    @source.save
    @user = Factory(:user)
    @items = @source.get_new_items
  end

  describe "GET 'vote_up'" do
    context "with user" do
      before(:each) do
        UserSession.create(@user, true)
        get 'vote_up', :id => @items.first.id
      end

      subject { assigns(:item) }
      its(:last_clicked_at) {should be_within(10.seconds).of(Time.now) }
      its(:total_votes) { should == 1 }
      its('votes.count') { should == 1 }

    end

    context "with no user" do
      before(:each) do
        UserSession.find(@user).destroy
        get 'vote_up', :id => @items.first.id
      end

      it "should flash 'Must be logged in'" do
        flash[:alert].should match /You must be logged in to vote/
      end
    end

  end

end

