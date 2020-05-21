class Question < ApplicationRecord
  extend Enumerize
  belongs_to :survey
  has_many :answers, dependent: :destroy
  has_many :variants, dependent: :destroy
  validates :title, presence: true
  validates :position, presence: true
  validates :kind, presence: true
  enumerize :kind, in: %i[check_boxes radio_buttons input], default: :input
end
