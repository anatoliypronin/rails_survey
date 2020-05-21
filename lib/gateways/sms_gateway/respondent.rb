require 'curb'

module Gateways::SmsGateway::Respondent
  module_function

  def send_sms_message(phone, message)
    # message = URI.encode_www_form_component(message.strip)
    # email = configus.sms_gateway.email
    # api_key = configus.sms_gateway.api_key
    # sign = URI.encode_www_form_component(configus.sms_gateway.sign)
    # channel = configus.sms_gateway.channel

    # url = "https://#{email}:#{api_key}@gate.smsaero.ru/v2/sms/send?number=#{phone}&text=#{sms_message}&sign=#{sign}&channel=#{channel}"
    # http = Curl.get url
  end
end
