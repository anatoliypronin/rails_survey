require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "should create tag" do
    tag = build :tag
    tag.save
    created_tag = Tag.last
    assert created_tag
  end
  test "should not create tag with empty title" do
    tag = build :tag, title: nil
    tag.save
    created_tag = Tag.last
    assert_nil created_tag
  end
end
