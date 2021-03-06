require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "should create question" do
    question = build :question
    question.save
    created_question = Question.last
    assert created_question
  end

  test "should not create question with empty title" do
    question = build :question, title: nil
    question.save
    created_question = Question.last
    assert_nil created_question
  end
end
