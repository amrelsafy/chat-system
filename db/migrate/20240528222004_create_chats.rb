class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.integer :chat_number
      t.string :application_token
      t.integer :message_count, default: 0
    
      t.timestamps
    end
  end
end

