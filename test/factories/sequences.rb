FactoryBot.define do
  sequence(:string, aliases: %i[first_name last_name password title type author]) { |n| "string#{n}" }
  sequence(:position) { |n| n }

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :phone, 10000000000, &:to_s
end
