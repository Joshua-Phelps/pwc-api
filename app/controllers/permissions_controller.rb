class PermissionsController < ApplicationController

  def update
    @user = User.find(params[:id])
    if @user.update(permissions_params)
      render :json => @user
    else 
      error_message
    end 
  end

  private 

  def permissions_params
    params.require(:permissions).permit(:permission_level)
  end 
end
