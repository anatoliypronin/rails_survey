require "test_helper"

class ChoiceFieldTest < ActiveSupport::TestCase
  test "should create choice_field with question" do
    choice_field = create :choice_field
    assert choice_field.question
  end
end
