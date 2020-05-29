FactoryBot.define do
  factory :question do
    survey
    title
    position
    kind { "check_boxes" }
  end
end
