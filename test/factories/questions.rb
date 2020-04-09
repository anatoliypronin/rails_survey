FactoryBot.define do
  factory :question do
    title
    position
    kind { "input" }
  end
end
