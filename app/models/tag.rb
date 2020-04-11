class Tag < ApplicationRecord
  extend Enumerize
  # belongs_to :user
  belongs_to :survey
  validates :title, presence: true
  
end
