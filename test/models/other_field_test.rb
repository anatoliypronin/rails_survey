require "test_helper"

class OtherFieldTest < ActiveSupport::TestCase
  test "should create other_field with question" do
    other_field = create :other_field
    assert other_field.question
  end
end
