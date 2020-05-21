require 'test_helper'

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respondent = create :respondent
  end

  test "shouldn't create session with empty form" do
    post api_v1_session_path

    assert_response :bad_request
  end

  test "shouldn't create session for non existant respondent" do
    options = { respondent: { phone: "00000000000000000" } }
    post api_v1_session_path, params: options

    assert_response :not_found

    assert_not session[:user_id]
  end

  test "should create sms_code then send it to respondent" do
    options = { respondent: { phone: @respondent.phone } }
    post api_v1_session_path, params: options

    assert_response :success
    assert session[:verification_code]
    assert_equal SmsService::TEST_VERIFICATION_CODE, session[:verification_code]

    assert_not session[:user_id]
  end

  test "shouldn't create session for respondent with wrong sms code" do
    options = { respondent: { phone: @respondent.phone, sms_code: "0000" } }
    post api_v1_session_path, params: options
    assert_response :unprocessable_entity

    assert_not session[:user_id]
  end


  test "should create session for respondent with correct sms code" do
    # Get sms code
    options = { respondent: { phone: @respondent.phone } }
    post api_v1_session_path, params: options

    # Send sms code for auth
    options = { respondent: { phone: @respondent.phone, sms_code: SmsService::TEST_VERIFICATION_CODE } }
    post api_v1_session_path, params: options

    assert_response :success
    assert session[:user_id]
  end


end
