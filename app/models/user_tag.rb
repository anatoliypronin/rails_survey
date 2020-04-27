class UserTag < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  validates :article, uniqueness: { scope: :tag }
end
