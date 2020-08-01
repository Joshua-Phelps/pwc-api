class PermissionsController < ApplicationController

  def update
    @user = User.find_by(email: permissions_params[:email])
    if @user.update(permissions_params)
      render :json => @user
    else 
      error_message
    end 
  end

  private 

  def permissions_params
    params.require(:permissions).permit(:isAdmin, :email)
  end 
end
