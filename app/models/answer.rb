class Answer < ApplicationRecord
  belongs_to :question
  validates :type, presence: true
end
