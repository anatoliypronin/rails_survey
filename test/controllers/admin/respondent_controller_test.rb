require 'test_helper'

class Admin::RespondentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new respondent' do
    get new_admin_respondent_path
    assert_response :success
  end
end