class Survey < ApplicationRecord
  has_many :tag, dependent: :destroy
  # belongs_to :user
  validates :title, presence: true
  state_machine initial: :active do
    state :active
    state :deleted
    state :close
    state :open

    event :del do
      transition active: :deleted
    end
    
    event :restore do
      transition deleted: :active
    end
    event :close do
      transition open: :close
    end

    event :open do
      transition close: :open
    end
  end
end
