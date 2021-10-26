class WelcomeController < ApplicationController
  def index
    render json: { status: 'Successfully working!' }
  end
end
