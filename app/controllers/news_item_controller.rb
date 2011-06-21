class NewsItemController < ApplicationController
  layout 'main'

  def list
    @items = NewsItem.paginate( :page => params[:page], :per_page => 25,
                                :order => 'last_clicked_at DESC' )
  end

  def vote_up
    @item = NewsItem.find(params[:id])
    @item.last_clicked_at = Time.now
    @item.total_votes += 1
    if @item.save
      flash[:notice] = "Item promoted"
      redirect_to request.referer
    end
  end

  def new
    @items = NewsItem.paginate( :page => params[:page], :per_page => 25,
                                :order => 'published_at DESC' )
  end

end

