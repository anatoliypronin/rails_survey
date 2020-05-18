require 'test_helper'

class Api::V1::SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = create :survey
  end

  test 'should get surveys list' do
    get api_v1_surveys_path
    assert_response :success
  end

  test 'should get survey' do
    get api_v1_survey_path(@survey)
    assert_response :success

    assert_equal response.parsed_body["title"], @survey.title
  end
end
