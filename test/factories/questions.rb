FactoryBot.define do
  factory :question do
    survey
    title
    position
    kind { "input" }
  end
end
