class Chat < ApplicationRecord
  validates :chat_number, uniqueness: true
end
