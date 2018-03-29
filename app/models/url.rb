class Url < ApplicationRecord
validates :long, uniqueness: true
before_validation :get_short, on: :create

def get_short
self.short = ('a'..'z').to_a.shuffle[0,2].join << SecureRandom.hex(1)
end
end
