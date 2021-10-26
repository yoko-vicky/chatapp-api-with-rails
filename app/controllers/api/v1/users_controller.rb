module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /users
      def index
        @users = User.all
        render json: @users
      end

      # POST /api/v1/users
      def create
        @user = User.create!(user_params)
        render json: :created
        # NOTE: needs to login
      end

      # GET /users/:id
      def show
        render json: @user
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
    end
  end
end
