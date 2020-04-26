FactoryBot.define do
  factory :user do
    first_name
    last_name
    type { "Admin" }
    state { "registration" }
  end
end
