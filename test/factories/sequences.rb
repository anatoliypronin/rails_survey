FactoryBot.define do
  sequence :title do |n|
    "String-#{n}"
  end
end
