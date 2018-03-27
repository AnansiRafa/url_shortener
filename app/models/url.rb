class Url < ApplicationRecord
validates :long, uniqueness: true
before_validation :get_short, on: :create

def get_short
self.short = SecureRandom.hex(2)
end
end
