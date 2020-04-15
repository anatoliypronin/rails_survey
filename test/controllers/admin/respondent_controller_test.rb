require 'test_helper'

class Admin::RespondentsControllerTest < ActionDispatch::IntegrationTest
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
end
