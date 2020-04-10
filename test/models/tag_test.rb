require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "should create tag" do
    tag = build :tag
    p tag
    tag.save
    created_tag = Tag.last
    assert created_tag
  end
end
