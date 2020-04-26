class UserSurvey < ApplicationRecord
  belongs_to :user
  state_machine initial: :in_process do
    state :process
    state :completed

    event :complet do
      transition [:process] => :completed
    end

    event :restore do
      transition [:completed] => :process
    end
  end
end
