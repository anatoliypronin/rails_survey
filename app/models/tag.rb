class Tag < ApplicationRecord
  extend Enumerize
  has_many :tag_surveys, dependent: :destroy
  has_many :surveys, through: :tag_surveys
  validates :title, presence: true
end
