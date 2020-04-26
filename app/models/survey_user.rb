class SurveyUser < ApplicationRecord
  belongs_to :user_survey
  belongs_to :survey
end
