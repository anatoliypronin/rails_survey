FactoryBot.define do
  sequence(:string, aliases: %i[title type]) { |n| "string#{n}" }

  sequence :variant_id do |n|
    n
  end
end
