require "test_helper"

class Admin::QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = create :question
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test "should get index questions" do
    create :tag
    get admin_questions_path
    assert_response :success
  end

  test "should get new question page" do
    get new_admin_question_path
    assert_response :success
  end

  test "should post create question" do
    question_attrs = attributes_for :question
    question_attrs[:survey_id] = @question.survey_id
    post admin_questions_path, params: { question: question_attrs }
    assert_response :redirect

    question = Question.last
    assert_equal question_attrs[:title], question.title
  end

  test "should not post create question" do
    question_attrs = attributes_for :question, title: nil
    question_attrs[:survey_id] = @question.survey_id
    post admin_questions_path, params: { question: question_attrs }
    assert_response :success

    question = Question.find_by(title: question_attrs[:title])
    assert_nil question
  end

  test "should delete destroy question" do
    delete admin_question_path(@question)
    assert_response :redirect

    assert_not Question.exists?(@question.id)
  end
end
