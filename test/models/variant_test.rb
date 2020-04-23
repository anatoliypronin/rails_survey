require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  test "should create variant" do
    variant = build :variant
    variant.save
    created_variant = Variant.last
    assert created_variant
  end
  test "should not create variant with empty title" do
    variant = build :variant, title: nil
    variant.save
    created_variant = Variant.last
    assert_nil created_variant
  end
end
