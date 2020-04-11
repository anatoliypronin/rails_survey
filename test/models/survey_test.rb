require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "should be create survey with user and tag" do
    survey = create :survey
    p survey
    assert survey
    
  end
end
