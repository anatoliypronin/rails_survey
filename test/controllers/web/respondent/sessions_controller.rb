require 'test_helper'

class Web::Respondent::SessionsControllerTest < ActionDispatch::IntegrationTest

  test 'should get new respondent session page' do
    get new_respondent_session_path
    assert_response :success
  end

  test 'should post create session for respondent' do
    respondent = create :respondent
    sign_in_as_respondent(respondent)
    assert_response :redirect

    assert_equal session[:user_id], respondent.id
  end

  # test 'should not post create session page for respondent' do
    # respondent = create :respondent
    # post respondent_session_path, params: { respondent: { phone: respondent.phone } }
    # assert_response :success

    # assert_nil session[:user_id]
  # end

  # test 'should delete destroy session page for respondent' do
    # respondent = create :respondent
    # sign_in_as_respondent(respondent)

    # assert_equal session[:user_id], respondent.id

    # delete respondent_session_path
    # assert_response :redirect

    # assert_nil session[:user_id]
  # end
end

