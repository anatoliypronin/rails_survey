require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    admin = create :admin
    sign_in_as_admin(admin)
  end
  
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

  test 'should post not create admin' do
    attrs = attributes_for(:admin, email: nil)

    post admin_admins_path, params: { admin: attrs }
    assert_response :success

    admin = Admin.find_by(email: attrs[:email])
    assert_nil admin
  end
end
