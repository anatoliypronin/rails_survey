require 'test_helper'

class Api::V1::Answer::OthersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respondent = create :respondent
    sign_in_as_respondent(@respondent)
  end

  test 'should post create otherField' do
    question = create :question
    other = build :other_field
    otherField_attributes = attributes_for(:other_field)
    otherField_attributes = { question_id: question.id, title: other.title}
    post api_v1_others_path(), params: { otherField: otherField_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_other_field = OtherField.find(data['id'])

    assert created_other_field.present?
    assert_equal otherField_attributes.stringify_keys, created_other_field.slice(*otherField_attributes.keys)
  end
end
