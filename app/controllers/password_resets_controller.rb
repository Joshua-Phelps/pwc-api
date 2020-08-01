class PasswordResetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :update]

  def create
    @user = User.find_by_email(password_reset_params[:email])
    if @user
      @user.send_password_reset 
      render :json => {message: 'Email sent'}, status: 200
    else 
      error_message
    end 
  end

  def update
    byebug
    @user = User.find_by_password_reset_token!(params[:token])
    if @user.password_reset_sent_at < 2.hour.ago
      render :json => {expired: "You token is expired. Please request a new one"}, status: 401
    elsif @user.update(password_reset_params)
      render :json => {success: 'Password was successfully reset'}, status: 200
    else 
      error_message
    end
  end
  
  private
    
    def password_reset_params
      params.require(:password_reset).permit(:password, :email)
    end



end
