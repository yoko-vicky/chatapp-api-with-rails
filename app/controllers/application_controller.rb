class ApplicationController < ActionController::API
  before_action :set_current_user
  # SECRET_KEY = Rails.application.credentials.jwt[:secret].to_s
  # EXPIRES_IN = Rails.application.credentials.jwt[:expires_in]

  def authorized
    render json: { message: 'Please log in' }, status: 401 unless logged_in?
  end

  def encode_token(payload)
    payload[:exp] = Rails.application.credentials.jwt[:expires_in].days.from_now.to_i
    JWT.encode(payload, Rails.application.credentials.jwt[:secret].to_s, 'HS256')
  end

  def auth_header
    return unless request.headers['Authorization']

    request.headers['Authorization'].split(' ')[1]
  end

  def decoded_token
    return unless auth_header

    token = auth_header
    begin
      JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end

  def logged_in?
    logged_in_user ? true : false
  end

  def set_current_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end
end
