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

    p s1.questions
    p ''
    p q1
    p ''
    p q1.variants

    p attributes_for :question

    answer_attrs = {q1.id => v1.id, q2.id => [v4.id, v6.id]}
    p answer_attrs
    post respondent_survey_answers_path(s1), params: { answers: answer_attrs }
    assert_response :redirect

  end

  # test "should post create question" do
  #   question_attrs = attributes_for :question
  #   question_attrs[:survey_id] = @question.survey_id
  #   post admin_survey_questions_path(@question.survey), params: { question: question_attrs }
  #   assert_response :redirect

  #   question = Question.last
  #   assert_equal question_attrs[:title], question.title
  # end
  # test 'should delete destroy session page for respondent' do
  #   respondent = create :respondent
  #   sign_in_as_respondent(respondent)

  #   assert_equal session[:user_id], respondent.id

  #   delete respondent_session_path
  #   assert_response :redirect

  #   assert_nil session[:user_id]
  # end
end
