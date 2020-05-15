require "test_helper"

class Web::Admin::Question::QuestionsControllerTest < ActionDispatch::IntegrationTest
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
end
