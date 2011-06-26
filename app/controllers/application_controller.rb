class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user, :user_logged_in?

  protected

    def facebook_client
      client_id = Rails.env.production? ? ENV['FACEBOOK_APP_ID'] : FBGraph.config['app_id']
      secret_id = Rails.env.production? ? ENV['FACEBOOK_APP_SECRET'] : FBGraph.config['app_secret']
      token = session['access_token']

      @facebook_client ||= FBGraph::Client.new(
        :client_id => client_id,
        :secret_id => secret_id,
        :token => token)
    end

  private

    def user_logged_in?
      !!current_user
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_no_user
      if current_user
        redirect_to homepage_path
        return false
      end
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to user_login_path
        return false
      end
    end
end

