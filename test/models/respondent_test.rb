require 'test_helper'

class RespondentTest < ActiveSupport::TestCase
  test "should phone presence" do
    respondent = build :respondent, phone: nil
    assert_not respondent.save
  end

  test "should respondent create" do
    create :respondent
    created_respondent = Respondent.last
    assert created_respondent
  end
end
