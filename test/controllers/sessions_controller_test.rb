require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    get new_session_path
    assert_response :success
  end
end