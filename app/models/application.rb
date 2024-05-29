class Application < ApplicationRecord
    before_create :set_token

    self.primary_key="application_token"

    def set_token
        self.application_token = SecureRandom.uuid
    end
end
