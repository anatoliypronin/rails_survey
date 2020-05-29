require 'test_helper'

class Api::V1::Answer::OthersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respondent = create :respondent
    sign_in_as_respondent(@respondent)
  end

  test 'should post create otherField' do
    question = create :question
    other = build :other_field
    other_field_attributes = { question_id: question.id, title: other.title }
    post api_v1_others_path, params: { otherField: other_field_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_other_field = OtherField.find(data['id'])

    assert created_other_field.present?
    assert_equal other_field_attributes.stringify_keys, created_other_field.slice(*other_field_attributes.keys)
  end
end
