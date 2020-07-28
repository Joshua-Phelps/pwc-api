class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.new(user_params)
    if user.save 
        render json: {success: 'User Created'}
    else 
        render json: {error: 'Unable to create user'}
    end 
  end

  private 

  def user_params
      params.require(:user).permit(:email, :password)
  end 
end
