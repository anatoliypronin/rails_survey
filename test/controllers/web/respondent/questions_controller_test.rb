require "test_helper"

class Web::Respondent::QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = create :question
    respondent = create :respondent
    sign_in_as_respondent(respondent)
  end

  test "should get index questions" do
    create :tag
    get respondent_survey_questions_path(@question.survey_id)
    assert_response :success
  end

  test "should get new question page" do
    get new_respondent_survey_question_path(@question.survey_id)
    assert_response :success
  end

  test "should post create question" do
    question_attrs = attributes_for :question
    question_attrs[:survey_id] = @question.survey_id
    post respondent_survey_questions_path(@question.survey), params: { question: question_attrs }
    assert_response :redirect

    question = Question.last
    assert_equal question_attrs[:title], question.title
  end

  test "should not post create question" do
    question_attrs = attributes_for :question, title: nil
    question_attrs[:survey_id] = @question.survey_id
    post respondent_survey_questions_path(@question.survey_id), params: { question: question_attrs }
    assert_response :success

    question = Question.find_by(title: question_attrs[:title])
    assert_nil question
  end

  test "should delete destroy question" do
    delete respondent_question_path(@question)
    assert_response :redirect

    assert_not Question.exists?(@question.id)
  end
end

