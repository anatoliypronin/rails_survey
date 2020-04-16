class User < ApplicationRecord
  validates :first_name,  presence: true,
                          length: { minimum: 2 }
  validates :last_name, presence: true,
                        length: { minimum: 2 }
  validates :type, presence: true

  state_machine initial: :registration do
    state :registration
    state :archive

    event :in_archive do
      transition [:registration] => :archive
    end

    event :restore do
      transition [:archive] => :registration
    end
  end
end
