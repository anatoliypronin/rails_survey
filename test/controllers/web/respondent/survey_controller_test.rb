require "test_helper"

class Web::Respondent::SurveyControllerTest < ActionDispatch::IntegrationTest
  setup do
    respondent = create :respondent
    sign_in_as_respondent(respondent)
    @survey = create :survey, user: respondent
  end

  test "should get index surveys" do
    get respondent_surveys_path
    assert_response :success
  end

  test "should get new survey page" do
    get new_respondent_survey_path
    assert_response :success
  end

  test "should post create survey" do
    survey_attrs = attributes_for :survey
    survey_attrs[:user_id] = @survey.user_id
    post respondent_surveys_path, params: { survey: survey_attrs }
    assert_response :redirect

    survey = Survey.last
    assert_equal survey_attrs[:title], survey.title
  end

  test "should not post create survey" do
    survey_attrs = attributes_for :survey, title: nil
    post respondent_surveys_path, params: { survey: survey_attrs }
    assert_response :success

    survey = Survey.find_by(title: survey_attrs[:title])
    assert_nil survey
  end

  test "should get show survey" do
    get respondent_survey_path(@survey)
    assert_response :success
  end

  test "shouldn't get show survey" do
    @survey = create :survey
    assert_raises(ActiveRecord::RecordNotFound) do
      get respondent_survey_path(@survey)
    end
  end

  test "should fet edit survey page" do
    get edit_respondent_survey_path(@survey)
    assert_response :success
  end

  test "should put update survey page" do
    attrs = {}
    attrs[:title] = generate :title

    put respondent_survey_path(@survey), params: { survey: attrs }
    assert_response :redirect

    @survey.reload
    assert_equal attrs[:title], @survey.title
  end

  test "should del survey page" do
    put del_respondent_survey_path(@survey)
    assert_response :redirect

    @survey.reload
    assert_equal @survey.state, 'deleted'
  end

  test 'should update survey with tags' do
    @tag = create :tag
    attrs_survey = attributes_for :survey
    attrs_survey[:tag_ids] = [@tag.id]
    put respondent_survey_path(@survey), params: { survey: attrs_survey }
    assert @survey.tags.include?(@tag)
  end
end
