class LangTag < ApplicationRecord
  belongs_to :user_pfof_lang_link
  belongs_to :event_lang_link
end
