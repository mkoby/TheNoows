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

      if user = user_class.find_by_facebook_id(fb_user.id)
        # If user's FB ID already exists, update the access token & login
        user.update_attribute(:facebook_access_token, access_token)

        user_session_class.create(user, true)
        user_session_class.find.save

      else
        # If user's FB ID isn't found, then register a new user
        if user = user_class.new_from_facebook(access_token, fb_user).save!
          user_session_class.create(user, true)
          user_session_class.find.save
        end

      end
      redirect_to homepage_path
    rescue OAuth2::ErrorWithResponse => auth_err
      logger.debug auth_err.response.body
    rescue Exception => e
      logger.debug e.message
      logger.debug e.backtrace
      flash[:alert] = "Unable to log you in via Facebook"
      redirect_to homepage_path
    end
  end

  protected

    def user_class
      User
    end

    def user_session_class
      UserSession
    end
end

