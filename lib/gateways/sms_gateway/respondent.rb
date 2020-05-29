require 'curb'

module Gateways::SmsGateway::Respondent
  module_function

  def send_sms_message(phone, message)
    sms_message = URI.encode_www_form_component(message.strip)
    email = "lexitor34%40gmail.com" # configus.sms_gateway.email
    api_key = 'a6NLLl8puBYe6omleV4SHrjXFTD0' # configus.sms_gateway.api_key
    sign = 'Sms Aero' # URI.encode_www_form_component(configus.sms_gateway.sign)
    channel = "DIRECT" # configus.sms_gateway.channel

    url = "https://#{email}:#{api_key}@gate.smsaero.ru/v2/sms/send?number=#{phone}&text=#{sms_message}&sign=#{sign}&channel=#{channel}"
    Curl.get url
  end
end
