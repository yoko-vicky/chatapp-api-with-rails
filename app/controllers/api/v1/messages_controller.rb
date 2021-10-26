module Api
  module V1
    class MessagesController < ApplicationController
      before_action :set_message, only: %i[show update destroy]

      # GET /messages
      def index
        @messages = Message.where(chatroom_id: params[:chatroom_id])
        render json: @messages
      end

      # POST /messages
      def create
        @message = Message.create!(
          content: message_params[:content], user_id: 1, chatroom_id: params[:chatroom_id]
          # NOTE: Needs to change the user_id to @current_user after implementing user auth
        )
        render json: :created
      end

      # GET /messages/:id
      def show
        render json: @message
      end

      # PUT /messages/:id
      def update
        @message.update(message_params)
        head :no_content
      end

      # DELETE /messages/:id
      def destroy
        @message.destroy
        head :no_content
      end

      private

      def message_params
        params.require(:message).permit(:content)
      end

      def set_message
        @message = Message.find(params[:id])
      end
    end
  end
end
