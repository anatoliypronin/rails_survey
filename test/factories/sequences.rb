FactoryBot.define do
  sequence :title do |n|
    "Title-#{n}"
  end

  sequence :position do |n|
    n
  end
end
