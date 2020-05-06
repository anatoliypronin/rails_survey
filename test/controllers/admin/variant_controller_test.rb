require 'test_helper'

class Admin::VariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variant = create :variant
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test "should get index page" do
    get admin_variants_path
    assert_response :success
  end

  test "should get new page" do
    get new_admin_variant_path
    assert_response :success
  end

  test "should post create variant" do
    variant_attrs = (FactoryBot.build :variant).attributes.symbolize_keys
    variant_attrs[:question_id] = @variant.question_id

    post admin_variants_path, params: { variant: variant_attrs }
    assert_response :redirect

    variant = Variant.last
    assert_equal variant_attrs[:title], variant.title
  end

  test "should not post create variant" do
    variant_attrs = attributes_for :variant, title: nil

    post admin_variants_path, params: { variant: variant_attrs }
    assert_response :success

    variant = Variant.find_by(title: variant_attrs[:title])
    assert_nil variant
  end

  test "should destroy variant" do
    delete admin_variant_path(@variant)
    assert_response :redirect

    assert_not Variant.exists?(@variant.id)
  end

  test "should get edit page" do
    get edit_admin_variant_path(@variant.id)
    assert_response :success
  end

  test "should put update client" do
    attrs = {}

    attrs[:title] = generate :title
    put admin_variant_path(@variant.id), params: { variant: attrs }

    @variant.reload
    assert_equal attrs[:title], @variant.title
  end


end
