module Api
  module V1
    class LoginController < ApplicationController
      # LOGIN
      def create
        @user = User.find_by(username: user_params[:username])

        if @user&.authenticate(user_params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { success: true, user: user_data(@user), token: token }
        else
          render json: { errors: ['Please provide correct username and password'] }
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :password)
      end

      def user_data(user)
        {
          id: user.id,
          username: user.username
        }
      end

    end
  end
end
