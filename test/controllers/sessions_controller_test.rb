require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session page' do
    get new_session_path
    assert_response :success
  end

  test 'should post create session page for admin' do
    admin = create :admin
    sign_in_as_admin(admin)
    assert_response :redirect

    assert_equal session[:user_id], admin.id
  end

  test 'should not post create session page for admin' do
    admin = create :admin
    post session_path, params: { user: { email: admin.email, password: 'bad_password' } }
    assert_response :success

    assert_nil session[:user_id]
  end

  test 'should delete destroy session page for admin' do
    admin = create :admin
    sign_in_as_admin(admin)

    assert_equal session[:user_id], admin.id

    delete session_path
    assert_response :redirect

    assert_nil session[:user_id]
  end
end
