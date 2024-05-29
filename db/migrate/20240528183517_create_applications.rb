class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications, id: false do |t|
      t.string :application_token, primary_key: true
      t.string :name
      t.integer :chat_count

      t.timestamps
    end
  end
end
