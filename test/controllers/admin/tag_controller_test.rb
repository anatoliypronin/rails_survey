require 'test_helper'

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = create :tag
  end

  test "should get new tags" do
    get new_admin_tag_path
    assert_response :success
  end

  test "should get index tags" do
    get admin_tags_path
    assert_response :success
  end

  test "should post create tag" do
    tag_attrs = attributes_for :tag
    post admin_tags_path, params: { tag: tag_attrs }
    assert_response :redirect

    tag = Tag.last
    assert_equal tag_attrs[:title], tag.title
  end

  test "should not post create tag" do
    tag_attrs = attributes_for :tag, title: nil
    post admin_tags_path, params: { tag: tag_attrs }
    assert_response :success

    tag = Tag.find_by(title: tag_attrs[:title])
    assert_nil tag
  end

  test "should delete destroy tag" do
    delete admin_tag_path(@tag)
    assert_response :redirect
    assert_not Tag.exists?(@tag.id)
  end

  test 'should update survey with tags' do
    @survey = create :survey
    attrs_tag = attributes_for :tag
    attrs_tag[:survey_ids] = [@survey.id]
    put admin_tag_path(@tag), params: { tag: attrs_tag }
    assert @tag.surveys.include?(@survey)
  end
end
