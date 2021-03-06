class ApplicationController < ActionController::API
  before_action :authorized

  def issue_token(user)
    JWT.encode({user_id: user.id}, ENV['JWT_SECRET_KEY'], ENV['JWT_ALG'])
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
  begin
    JWT.decode(token, ENV['JWT_SECRET_KEY'], true, { :algorithm => ENV['JWT_ALG'] })
  rescue JWT::DecodeError
    [{error: "Invalid Token"}]
  end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def logged_in?
    !!current_user
  end

  def permission_level(level)
    current_user.permission_level >= level
  end 

  def authorized
    render json: { error: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def error_message
    render json: { error: 'Unable to complete request' }, status: 422
  end 

  def permission_denied(level)
    render :json => {error: 'You do not have permission to view this information'}, status: 401 unless permission_level(level)
  end 
end
