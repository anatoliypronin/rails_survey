require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test 'should get index users' do
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

  test 'should get edit respondent page' do
    respondent = create :respondent
    get edit_admin_user_path(respondent)
    assert_response :success
  end

  test 'should get edit admin page' do
    admin = create :admin
    get edit_admin_user_path(admin)
    assert_response :success
  end

  test 'should put update admin page' do
    admin = create :admin
    attrs = {}
    attrs[:email] = generate :email

    put admin_user_path(admin), params: { admin: attrs }
    assert_response :redirect

    admin.reload
    assert_equal attrs[:email], admin.email
  end

  test 'should put update respondent page' do
    respondent = create :respondent
    attrs = {}
    attrs[:phone] = generate :phone

    put admin_user_path(respondent), params: { respondent: attrs }
    assert_response :redirect

    respondent.reload
    assert_equal attrs[:phone], respondent.phone
  end

  test 'should put in_archive admin page' do
    admin = create :admin

    put in_archive_admin_user_path(admin)
    assert_response :redirect

    admin.reload
    assert_equal admin.state, 'archive'
  end

  test 'should put in_archive respondent page' do
    respondent = create :respondent

    put in_archive_admin_user_path(respondent)
    assert_response :redirect

    respondent.reload
    assert_equal respondent.state, 'archive'
  end

  test 'should put restore respondent page' do
    respondent = create :respondent
    respondent.in_archive
    assert_equal respondent.state, 'archive'
    put restore_admin_user_path(respondent)
    assert_response :redirect

    respondent.reload
    assert_equal respondent.state, 'registration'
  end

  test 'should put restore admin page' do
    admin = create :admin
    admin.in_archive
    assert_equal admin.state, 'archive'
    put restore_admin_user_path(admin)
    assert_response :redirect

    admin.reload
    assert_equal admin.state, 'registration'
  end
end
