require "test_helper"

class Admin::SurveyControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = create :survey
  end

  test "should get index surveys" do
    get admin_surveys_path
    assert_response :success
  end

  test "should get new survey page" do
    get new_admin_survey_path
    assert_response :success
  end

  test "should post create survey" do
    survey_attrs = attributes_for :survey
    post admin_surveys_path, params: { survey: survey_attrs }
    assert_response :redirect

    survey = Survey.last
    assert_equal survey_attrs[:title], survey.title
  end

  test "should not post create survey" do
    survey_attrs = attributes_for :survey, title: nil
    post admin_surveys_path, params: { survey: survey_attrs }
    assert_response :success

    survey = Survey.find_by(title: survey_attrs[:title])
    assert_nil survey
  end

  test "should delete destroy survey" do
    delete admin_survey_path(@survey)
    assert_response :redirect

    assert_not Survey.exists?(@survey.id)
  end
end
