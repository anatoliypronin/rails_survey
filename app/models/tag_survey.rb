class TagSurvey < ApplicationRecord
  belongs_to :survey
  belongs_to :tag
  validates :article, uniqueness: { scope: :tag }
end
