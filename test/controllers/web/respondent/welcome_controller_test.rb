require "test_helper"

class Web::Respondent::WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    respondent = create :respondent
    sign_in_as_respondent(respondent)
    @survey = create :survey, user: respondent
  end

  test "should get welcome page" do
    get respondent_root_path
    assert_response :success
  end

  test "should show survey" do
    get respondent_welcome_path(@survey)
    assert_response :success
  end
end
