require 'spec_helper'

describe NewsItem do
  before(:each) do
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category_id => @source_category.id)
    @item = Factory(:news_item, :source_id => @source.id)
  end

  it "should not allow duplicates" do
    expect { NewsItem.create!(:source_id => @source.id, :title => @item.title, :link => @item.link, :published_at => @item.published_at) }.to raise_error
  end

  context "#vote_up" do
    before(:each) do
      @item.vote_up(Factory(:user))
    end

    it "should increase vote_count" do
      @item.total_votes.should == 1
    end

    it "should create vote record" do
      @item.votes.count.should == 1
      @item.votes.first.user == User.first
      @item.votes.first.news_item == @item
    end
  end

end

