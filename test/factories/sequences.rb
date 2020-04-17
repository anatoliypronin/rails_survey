FactoryBot.define do
  sequence(:string, aliases: %i[title type]) { |n| "string#{n}" }
  sequence(:variant_id, :position) { |n| n }
end
