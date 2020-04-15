require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new admin' do
    get new_admin_admin_path
    assert_response :success
  end
end
