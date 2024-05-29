class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :message_number
      t.references :chat, null: false, foreign_key: true
      t.string :application_token

      t.timestamps
    end
  end
end
