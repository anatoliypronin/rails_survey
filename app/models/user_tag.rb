class UserTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  validates :user, uniqueness: { scope: :tag }
end
