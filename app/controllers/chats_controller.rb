class ChatsController < ApplicationController
    before_action :set_chats
    before_action :set_chat, except: [:index, :create]
    
    def index
        if @chats!=nil
            render json: @chats
        else
            render status: :unprocessable_entity
        end
    end

    def create    
        last_chat = @chats.order(:chat_number).lock(true).last
        @max_chat_number = last_chat ? last_chat.chat_number + 1 : 1

        @chat = CreateChatJob.perform_later(chat_number: @max_chat_number, application_token: @application_token)
        
        render json: {chat_number: @max_chat_number, message: "Chat is now being processed"} ,status: :accepted
    end

    private
        def set_chats
            @application_token=params[:application_id]
            @chats=Chat.where(application_token: @application_token)
        end

        def set_chat
            @chat = Chat.find_by(params[:id])
        end
end
