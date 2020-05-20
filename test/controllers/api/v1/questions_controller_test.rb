require 'test_helper'

class Api::V1::QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = create :question
  end

  test 'should get question list' do
    get api_v1_survey_questions_path(@question.survey_id)

    assert_response :success
  end
end
