require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index users' do
    create :respondent

    get admin_users_path
    assert_response :success
  end

  test 'should get show admin' do
    admin = create :admin

    get admin_user_path(admin)
    assert_response :success
  end

  test 'should get show respondent' do
    respondent = create :respondent

    get admin_user_path(respondent)
    assert_response :success
  end
end
