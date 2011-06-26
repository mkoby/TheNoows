class NewsItemController < ApplicationController
  before_filter :get_user, :only => :vote_up
  layout 'main'

  def list
    @items = NewsItem.paginate( :page => params[:page], :per_page => 25,
                                :order => 'last_clicked_at DESC' )
  end

  def vote_up
    @item = NewsItem.find(params[:id])
    if @item.vote_up(@user)
      flash[:notice] = "Item promoted"
      redirect_to request.referer
    end
  end

  def new
    @items = NewsItem.paginate( :page => params[:page], :per_page => 25,
                                :order => 'published_at DESC' )
  end


  private

    def get_user
      @user = current_user

      unless @user
        flash[:alert] = "You must be logged in to vote"
        redirect_to request.referrer
      end
    end

end

