class User < ApplicationRecord
  has_and_belongs_to_many :tags

  validates :first_name,  presence: true,
                          length: { minimum: 2 }
  validates :last_name, presence: true,
                        length: { minimum: 2 }

  state_machine initial: :registration do
    state :registration
    state :archived

    event :archived do
      transition [:registration] => :archived
    end

    event :restore do
      transition [:archived] => :registration
    end
  end
end
