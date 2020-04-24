require 'test_helper'

class Admin::RespondentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    admin = create :admin
    sign_in_as_admin(admin)
  end
  
  test 'should get new respondent' do
    get new_admin_respondent_path
    assert_response :success
  end

  test 'should post create respondent' do
    attrs = attributes_for(:respondent)

    post admin_respondents_path, params: { respondent: attrs }
    assert_response :redirect

    respondent = Respondent.last
    assert_equal respondent.phone, attrs[:phone]
  end

  test 'should post not create respondent' do
    attrs = attributes_for(:respondent, phone: nil)

    post admin_respondents_path, params: { respondent: attrs }
    assert_response :success

    respondent = Respondent.find_by(phone: attrs[:phone])
    assert_nil respondent
  end
end
