class NewsItemController < ApplicationController
  before_filter :get_user, :only => :vote_up
  layout 'main'

  def vote_up
    @item = NewsItem.find(params[:id])
    if @item.vote_up(@user)
      redirect_to request.referer
    end
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

