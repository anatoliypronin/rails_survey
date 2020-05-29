FactoryBot.define do
  factory :question do
    survey
    title
    position
    kind { "check_box" }
  end
end
