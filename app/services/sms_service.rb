module SmsService
  TEST_VERIFICATION_CODE = "1234".freeze

  class << self
    def send_sms_code(phone)
      return TEST_VERIFICATION_CODE if Rails.env.test?

      code = rand(1000..9999).to_s
      message = "Проверочный код: #{code}"

      Gateways::SmsGateway::Respondent.send_sms_message(phone, message)

      code
    end
  end
end
