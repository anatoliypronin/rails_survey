FactoryBot.define do
  sequence(:string, aliases: %i[first_name last_name password title type]) { |n| "string#{n}" }
  sequence(:variant_id, :position) { |n| n }

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :phone, 10000000000, &:to_s
  sequence :title do |n|
    "Title-#{n}"
  end
end
