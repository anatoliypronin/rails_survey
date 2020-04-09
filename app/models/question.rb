class Question < ApplicationRecord
  validates :title, presence: true
  validates :position, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: %w[check_box radio_button input] }
end
