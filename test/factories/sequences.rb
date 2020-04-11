FactoryBot.define do
  sequence :string, aliases: [:title, :author] do |n|
    "String-#{n}"
  end
end
