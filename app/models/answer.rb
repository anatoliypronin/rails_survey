class Answer < ApplicationRecord
  belongs_to :variant
  belongs_to :question, presence: true
  validates :type, presence: true
end
