class SurveyUser < ApplicationRecord
  belongs_to :user_survey
  belongs_to :survey
  validates :survey_id, uniqueness: { scope: :survey }
end
