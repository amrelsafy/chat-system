class Message < ApplicationRecord
  belongs_to :chat

  include Elasticsearch::Model

  settings index: { number_of_shards: 2 } do
    mappings dynamic: false do
      indexes :body, type: 'text', analyzer: 'english'
      indexes :chat_id, type: 'keyword'
      indexes :application_token, type: 'keyword'
    end
  end
end
