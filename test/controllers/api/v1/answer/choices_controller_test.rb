require 'test_helper'

class Api::V1::Answer::ChoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respondent = create :respondent
    sign_in_as_respondent(@respondent)
  end

  test 'should post create choiceField' do
    question = create :question
    variant = create :variant
    choiceField_attributes = { question_id: question.id, variant_id: variant.id}
    post api_v1_choices_path(), params: { choiceField: choiceField_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_choice_field = ChoiceField.find(data['id'])

    assert created_choice_field.present?
    assert_equal choiceField_attributes.stringify_keys, created_choice_field.slice(*choiceField_attributes.keys)
  end
end
