class TagSurvey < ApplicationRecord
  belongs_to :survey
  belongs_to :tag
  validates :title, uniqueness: { scope: :tag }
end
