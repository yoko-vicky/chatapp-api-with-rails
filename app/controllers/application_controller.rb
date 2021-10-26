class ApplicationController < ActionController::API
  def index
    render json: { status: 'Successfully working' }
  end
end
