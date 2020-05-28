require 'test_helper'

class Web::Respondent::AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    respondent = create :respondent
    sign_in_as_respondent(respondent)
    @survey = create :survey
  end

  test 'should get new answer page' do
    get new_respondent_survey_answer_path(@survey)
    assert_response :success
  end

  test 'should post create answer for respondent' do
    question1 = create :question, survey_id: @survey.id, kind: "radio_buttons"
    question2 = create :question, survey_id: @survey.id, kind: "check_boxes"
    variant1 = create :variant, question_id: question1.id
    variant2 = create :variant, question_id: question2.id
    answer_attrs = { question1.id => variant1.id, question2.id => variant2.id }

    post respondent_survey_answers_path(@survey), params: { answers: answer_attrs }
    assert_response :redirect
    answer = Answer.find_by(question_id: question1)
    assert_equal answer.variant_id, variant1.id
    answer = Answer.find_by(question_id: question2)
    assert_equal answer.variant_id, variant2.id
  end
end
