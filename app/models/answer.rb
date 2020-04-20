class Answer < ApplicationRecord
  # belongs_to :variant
  belongs_to :question
  validates :type, presence: true
end
