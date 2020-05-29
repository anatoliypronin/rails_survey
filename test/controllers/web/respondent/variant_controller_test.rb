require 'test_helper'

class Web::Respondent::VariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variant = create :variant
    respondent = create :respondent
    sign_in_as_respondent(respondent)
  end

  test "should get index page" do
    get respondent_question_variants_path(@variant.question_id)
    assert_response :success
  end

  test "should get new page" do
    get new_respondent_question_variant_path(@variant.question_id)
    assert_response :success
  end

  test "should post create variant" do
    question = create :question
    variant_attrs = attributes_for :variant, question_id: question.id

    post respondent_question_variants_path(@variant.question), params: { variant: variant_attrs }
    assert_response :redirect

    variant = Variant.last
    assert_equal variant_attrs[:title], variant.title
  end

  test "should not post create variant" do
    variant_attrs = attributes_for :variant, title: nil

    post respondent_question_variants_path(@variant.question_id), params: { variant: variant_attrs }
    assert_response :success

    variant = Variant.find_by(title: variant_attrs[:title])
    assert_nil variant
  end

  test "should destroy variant" do
    delete respondent_variant_path(@variant)
    assert_response :redirect

    assert_not Variant.exists?(@variant.id)
  end

  test "should get edit page" do
    get edit_respondent_variant_path(@variant)
    assert_response :success
  end

  test "should put update client" do
    attrs = {}

    attrs[:title] = generate :title
    put respondent_variant_path(@variant), params: { variant: attrs }

    @variant.reload
    assert_equal attrs[:title], @variant.title
  end
end
