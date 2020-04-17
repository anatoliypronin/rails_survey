require "test_helper"

class ChoiceFieldTest < ActiveSupport::TestCase
  test "should create choise_field" do
    create :choise_field
    created_choise_field = ChoiceField.last
    assert created_choise_field
  end

  test "should variant_id pesence" do
    choise_field = build :choise_field, variant_id: nil
    assert_not choise_field.save
  end
end
