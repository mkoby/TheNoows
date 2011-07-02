class OauthController < ApplicationController
  def new
    redirect_to facebook_client.authorization.authorize_url(
        :redirect_uri => callback_oauth_url,
        :scope => FBGraph.config['permissions'])
  end

  def callback
    begin
      access_token = facebook_client.authorization.process_callback(params[:code], :redirect_uri => callback_oauth_url)
      session[:access_token] = access_token
      fb_user = facebook_client.selection.me.info!.data
      user = get_user_from_fb_user(access_token, fb_user)
    rescue OAuth2::ErrorWithResponse => auth_err
      logger.debug auth_err.response.body
    rescue Exception => e
      logger.debug e.message
      logger.debug e.backtrace
      flash[:alert] = "Unable to log you in via Facebook"
    end

    create_user_session(user) if user
    redirect_to request.referrer
  end

  protected

    def get_user_from_fb_user(access_token, fb_user)
      if user = user_class.find_by_facebook_id(fb_user.id)
        # If user's FB ID already exists, update the access token & login
        user.update_attribute(:facebook_access_token, access_token)
      else
        # If user's FB ID isn't found, then register a new user
        user = user_class.new_from_facebook(access_token, fb_user).save!
      end

      return user
    end

    def create_user_session(user)
      user_session_class.create(user, true)
      user_session_class.find.save
    end

    def user_class
      User
    end

    def user_session_class
      UserSession
    end
end

