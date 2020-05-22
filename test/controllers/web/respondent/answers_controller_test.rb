require 'test_helper'

class Web::Respondent::AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    respondent = create :respondent
    sign_in_as_respondent(respondent)
  end

  test 'should get new answer page' do
    s1 = create :survey

    q1 = create :question, survey_id: s1.id, kind: "radio_buttons"
    q2 = create :question, survey_id: s1.id
    
    v1 = create :variant, question_id: q1.id
    v2 = create :variant, question_id: q1.id
    v3 = create :variant, question_id: q1.id

    v4 = create :variant, question_id: q2.id
    v5 = create :variant, question_id: q2.id
    v6 = create :variant, question_id: q2.id
    v7 = create :variant, question_id: q2.id

    get new_respondent_survey_answer_path(s1)
    assert_response :success
  end

  test 'should post create answer for respondent' do
    s1 = create :survey

    q1 = create :question, survey_id: s1.id, kind: "radio_buttons"
    q2 = create :question, survey_id: s1.id, kind: "check_boxes"
    
    v1 = create :variant, question_id: q1.id
    v2 = create :variant, question_id: q1.id
    v3 = create :variant, question_id: q1.id

    v4 = create :variant, question_id: q2.id
    v5 = create :variant, question_id: q2.id
    v6 = create :variant, question_id: q2.id
    v7 = create :variant, question_id: q2.id

    answer_attrs = {q1.id => v1.id, q2.id => v2.id}

    post respondent_survey_answers_path(s1), params: { answers: answer_attrs }
    assert_response :redirect
    answer = Answer.find_by(question_id: q1)
    assert_equal answer.variant_id, v1.id
    answer = Answer.find_by(question_id: q2)
    assert_equal answer.variant_id, v2.id
  end

end
