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

  describe "#vote_up" do
    before(:each) do
      @item.vote_up(Factory(:user))
    end

    context "news_item" do
      subject { @item }
      its(:total_votes) { should == 1 }
    end

    context "news_item.votes" do
      subject { @item.votes }
      its(:count) { should == 1 }
    end

    context "news_item.votes.first" do
      subject { @item.votes.first }
      its(:user) { should == User.first }
      its(:news_item) { should == @item }
    end
  end

end

