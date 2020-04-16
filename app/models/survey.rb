class Survey < ApplicationRecord
  # has_many :tags, through: :tag_surveys
  # has_many :tag_surveys, dependent: :destroy
  # belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  state_machine initial: :active do
    state :active
    state :deleted
    state :close
    state :opened

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
    event :close do
      transition opened: :close
    end

    event :opened do
      transition close: :opened
    end
  end
end
