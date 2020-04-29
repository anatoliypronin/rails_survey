class TagSurvey < ApplicationRecord
  belongs_to :survey
  belongs_to :tag
  validates :survey, uniqueness: { scope: :tag }
end
