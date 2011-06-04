class NewsItemController < ApplicationController
  def list
    @items = NewsItem.paginate( :page => params[:page], :per_page => 50, :order => 'published_at DESC', :group => 'news_items.published_at, news_items.link, news_items.title, news_items.total_votes, news_items.created_at, news_items.updated_at' )
  end

  def vote_up
  end

end
