require "test_helper"

class OtherFieldTest < ActiveSupport::TestCase
  test "should create other_field" do
    create :other_field
    created_other_field = OtherField.last
    assert created_other_field
  end

  test "sould title presence" do
    other_field = build :other_field, title: nil
    assert_not other_field.save
  end
end
