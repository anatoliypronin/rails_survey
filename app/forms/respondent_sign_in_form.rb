class RespondentSignInForm
  include Virtus.model
  include ActiveModel::Model
  include ActiveModel::Validations

  attribute :phone, String
  attribute :sms_code, String

  validates :phone, presence: true

  def respondent
    Respondent.find_by(phone: phone)
  end
end
