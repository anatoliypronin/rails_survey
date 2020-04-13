class User < ApplicationRecord
  validates :first_name,  presence: true,
                          length: { minimum: 2 }
  validates :last_name, presence: true,
                        length: { minimum: 2 }

  state_machine initial: :registration do
    state :registration
    state :archive

    event :in_archive do
      transition [:registration] => :archive
    end

    event :restore do
      transition [:archived] => :registration
    end
  end
end
