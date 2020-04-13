require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index users' do
    create :respondent

    get admin_users_path
    assert_response :success
  end
end