class UserPfofLangLink < ApplicationRecord
  has_many :user_profs
  has_many :lang_tags
end
