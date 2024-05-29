class AddForeignKeyToChats < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :chats, :applications, column: :application_token, primary_key: :application_token
  end
end
