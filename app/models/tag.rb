class Tag < ApplicationRecord
  extend Enumerize
  belongs_to :user
  validates :title, presence: true
  
end
