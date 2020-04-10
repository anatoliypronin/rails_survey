class Question < ApplicationRecord
  extend Enumerize
  validates :title, presence: true
  validates :position, presence: true
  validates :kind, presence: true
  enumerize :kind, in: %i[check_box radio_button input], default: :input
end
