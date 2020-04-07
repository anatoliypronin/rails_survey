class Respondent < User
  validates :phone, presence: true
                    numericality: { only_integer: true }
end
