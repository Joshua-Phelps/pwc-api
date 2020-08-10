class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action only: [:index] do 
    permission_denied(3)
  end 


  def index
      users = User.all
      render :json => users
  end

  def create
    user = User.new(user_params)
    if user.save 
        # UserMailer.welcome_email(user).deliver_now
        render json: {success: 'User Created'}, status: 200
    else 
      error_message
    end 
  end

  private 

  def user_params
      params.require(:user).permit(:email, :password, :username)
  end 
end
