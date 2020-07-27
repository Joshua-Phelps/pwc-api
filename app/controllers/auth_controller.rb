class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  
  def create
    # byebug
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      token = issue_token(user)
      render json: {user: ActiveModelSerializers::SerializableResource.new(user), jwt: token}
    else
      render json: {error: 'That user could not be found'}, status: 401
    end
  end

  def show
      user = User.find_by(id: user_id)
      if logged_in?
        render json: user
      else
        render json: {error: 'No user could be found'}, status: 401
      end
  end

  private 

  def auth_params
      params.require(:auth).permit(:email, :password)
  end 
end
