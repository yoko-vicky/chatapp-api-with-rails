module Api
  module V1
    class LoginController < ApplicationController
      # AUTO_LOGIN
      def create
        @user = logged_in_user

        if @user
          render json: { success: true, user: user_data(@user), token: token }
        else
          render json: { errors: ['Please login'] }
        end
      end

      private

      def user_data(user)
        {
          id: user.id,
          username: user.username
        }
      end
    end
  end
end
