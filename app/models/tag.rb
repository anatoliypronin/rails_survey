class Tag < ApplicationRecord
  extend Enumerize
  validates :title, presence: true
  
end
