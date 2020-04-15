require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new admin' do
    get new_admin_admin_path
    assert_response :success
  end

  test 'should post create admin' do
    attrs = attributes_for(:admin)

    post admin_admins_path, params: { admin: attrs }
    assert_response :redirect

    admin = Admin.last
    assert_equal admin.email, attrs[:email]
  end
end
