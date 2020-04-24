class SurveyDecorator < ApplicationDecorator
  delegate_all

  def created_at
    object.created_at.strftime('%A, %B %e')
  end
end
