class SessionsController < ApplicationController

  def googleAuth
    byebug
    # Get access tokens from the google server
    # access_token = request.env["omniauth.auth"]
    # user = User.from_omniauth(access_token)
    @user = User.from_omniauth(auth)
    log_in(@user)
    # Access_token is used to authenticate request made from the rails application to the google server
    @user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    @user.google_refresh_token = refresh_token if refresh_token.present?
    @user.save
    render :json => @user
  end

  # def omniauth
  #   @user = User.from_omniauth(auth)
  #   @user.save
  #   session[:user_id] = @user.id
  #   redirect_to home_path
  # end

  private
  def auth
    request.env['omniauth.auth']
  end

end 