class NewsItemController < ApplicationController
  before_filter :get_user, :only => :vote_up
  layout 'main'

  def vote_up
    @item = NewsItem.find(params[:id])
    returnObj = { :success => false }

    unless @item.users.include?(@user)
      if @item.vote_up(@user)
        returnObj = { :success => true }
      end
    end

    respond_to do |format|
        format.html { redirect_to request.referer }
        format.js {
          response.content_type = Mime::JSON
          render :text => returnObj.to_json
        }
    end
  end

  private

    def get_user
      @user = current_user

      unless @user
        respond_to do |format|
          format.all {
            flash[:alert] = "You must be logged in to vote"
          }
        end
        redirect_to request.referrer
      end
    end

end

