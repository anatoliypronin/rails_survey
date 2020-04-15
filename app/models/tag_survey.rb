class TagSurvey < ApplicationRecord
  belongs_to :survey
  belongs_to :tag
end
