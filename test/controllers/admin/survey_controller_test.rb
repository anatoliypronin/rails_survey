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
    survey_attrs[:user_id] = @survey.user_id
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

  test "should get show survey" do
    get admin_survey_path(@survey)
    assert_response :success
  end

  test "should fet edit survey page" do
    get edit_admin_survey_path(@survey)
    assert_response :success
  end

  test "should put update survey page" do
    attrs = {}
    attrs[:title] = generate :title

    put admin_survey_path(@survey), params: { survey: attrs }
    assert_response :redirect

    @survey.reload
    assert_equal attrs[:title], @survey.title
  end

  test "should delete destroy survey" do
    delete admin_survey_path(@survey)
    assert_response :redirect

    assert_not Survey.exists?(@survey.id)
  end

  test "should put restore survey page" do
    put del_admin_survey_path(@survey)
    assert_response :redirect

    @survey.reload
    assert_equal @survey.state, 'deleted'
  end

  test "should put del survey page" do
    put restore_admin_survey_path(@survey)
    assert_response :redirect

    @survey.reload
    assert_equal @survey.state, 'active'
  end
end
