require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "should create Survey" do
    survey = create :survey
    survey.save
    created_survey = Survey.last
    assert created_survey
  end
  test "should not create survey with empty title" do
    survey = build :survey, title: nil
    survey.save
    created_survey = Survey.last
    assert_nil created_survey
  end
end
