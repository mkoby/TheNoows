require 'spec_helper'

describe Source do
  before(:each) do
    @source_category = Factory(:source_category)
    @source = Factory(:source, :source_category => @source_category)
  end

  context "#source_category" do
    subject { @source = Factory(:source, :source_category_id => @source_category.id) }
    its(:source_category_id) { should == @source_category.id }
    its(:source_category) { should == @source_category }
  end

  context "CNN RSS Feed" do
    before(:each) do
      #Use the local file to test parsing
      @source.rss_url = File.dirname(__FILE__) + "/../files/cnn_topstories.rss"
      @source.save
    end

    describe "#get_feed_content" do
      context "#entries" do
        subject { @source.send "get_feed_content" }
        its(:entries) { should_not be_nil }
      end

      context "feed's first entry" do
        subject { @source.send("get_feed_content").entries.first }
        its(:title) { should match(/^NATO/) }
        its(:url) { should == "http://rss.cnn.com/~r/rss/cnn_topstories/~3/o7jMSeIIogM/index.html" }
        its(:summary) { should match(/^An airstrike hit two houses/) }
      end
    end

    context "#get_new_items" do
      subject { @source.get_new_items }
      its(:count) { should == 10 }
    end
  end

  context "Fox News RSS Feed" do
    before(:each) do
        #Use the local file to test parsing
        @source.rss_url = File.dirname(__FILE__) + "/../files/foxnews_latest.rss"
        @source.save
      end

    context "#get_feed_content" do
      context "#entries" do
        subject { @source.send "get_feed_content" }
        its(:entries) { should_not be_nil }
      end

      context "feed's first entry" do
        subject { @source.send("get_feed_content").entries.first }
        its(:title) { should match(/^Tighter/) }
        its(:url) { should == "http://www.foxnews.com/politics/2011/05/28/obama-administration-eyeing-gun-control-radar-groups-warn/" }
        its(:summary) { should match(/^Gun rights groups fear Obama/) }
      end
    end

    context "#get_new_items" do
      subject { @source.get_new_items }
      its(:count) { should == 33 }
    end
  end
end

