class Join < ApplicationRecord
  has_many :user_profs
  has_many :events
end
