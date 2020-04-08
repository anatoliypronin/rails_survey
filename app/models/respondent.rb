class Respondent < User
  validates :phone, presence: true,
                    numericality: { only_integer: true },
                    length: { is: 11 }
end
