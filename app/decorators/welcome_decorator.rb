class WelcomeDecorator < ApplicationDecorator
  delegate_all

  decorates_association :survey
end
