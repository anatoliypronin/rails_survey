class Tag < ApplicationRecord
  extend Enumerize
  has_many :tag_surveys, dependent: :destroy
  has_many :surveys, through: :tag_surveys
  has_many :users, through: :user_tags
  validates :title, presence: true
end
