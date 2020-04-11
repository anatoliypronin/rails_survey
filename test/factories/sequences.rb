FactoryBot.define do
  sequence :string, aliases: [:title, :autohor] do |n|
    "String-#{n}"
  end
end
