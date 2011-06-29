class UserSessionController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new

    respond_to do |format|
      if user_logged_in?
        format.html { redirect_to homepage_path }
      else
        format.html { render :action => :new }
      end
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to homepage_path }
      else
        flash[:notice] = "Incorrect email address or password"
        format.html { render :action => :new }
      end
    end
  end

  def destroy
    current_user_session.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer }
    end
  end
end

