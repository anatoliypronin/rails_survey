require 'test_helper'

class Web::Respondent::ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    respondent = create :respondent
    sign_in_as_respondent(respondent)
  end

  test "should get show survey" do
    get respondent_profile_path
    assert_response :success
  end

  test "should get edit survey page" do
    get edit_respondent_profile_path
    assert_response :success
  end
end
