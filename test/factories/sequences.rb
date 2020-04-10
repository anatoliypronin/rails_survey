FactoryBot.define do
  sequence :string, aliases: [:title] do |n|
    "String-#{n}"
  end
end
