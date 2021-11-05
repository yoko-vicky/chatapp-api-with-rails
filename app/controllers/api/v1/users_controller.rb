module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /users
      def index
        @users = User.all
        render json: @users
      end

      # GET /users/:id
      def show
        render json: @user
      end

      # POST /api/v1/users
      # SIGNUP
      def create
        @user = User.create(username: user_params[:username], password: user_params[:password])
        if @user.valid?
          token = encode_token({ user_id: @user.id })
          render json: { success: true, user: user_data(@user), token: token }, status: 201
        else
          render json: { errors: @user.errors.full_messages }
        end
      end

      # PUT /users/:id
      def update
        @user.update(user_params)
        head :no_content
      end

      # DELETE /users/:id
      def destroy
        @user.destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:username, :password)
      end

      def set_user
        @user = User.find(params[:id])
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
