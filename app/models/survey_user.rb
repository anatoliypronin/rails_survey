class SurveyUser < ApplicationRecord
  belongs_to :user_survey
  belongs_to :survey
  validates :user_survey, uniqueness: { scope: :survey }
end
