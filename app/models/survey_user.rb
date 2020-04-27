class SurveyUser < ApplicationRecord
  belongs_to :user_survey
  belongs_to :survey
  validates :article, uniqueness: { scope: :user_survey }
end
