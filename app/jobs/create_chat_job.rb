class CreateChatJob < ApplicationJob
    queue_as :default
  
    def perform(chat_params)
      Chat.create!(chat_params)
    end
  end
  