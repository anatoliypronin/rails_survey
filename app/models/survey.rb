class Survey < ApplicationRecord
  has_many :tags, through: :tag_surveys
  has_many :tag_surveys, dependent: :destroy
  has_many :questions, dependent: :destroy
  #belongs_to :user
  validates :title, presence: true
  state_machine initial: :active do
    state :active
    state :deleted
    state :closed
    state :opened

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
    event :close do
      transition opened: :closed
    end

    event :to_open do
      transition closed: :opened
    end
  end
end
