FactoryBot.define do
  factory :survey do
    title { "MyString" }
    public { false }
    tag { nil }
    author 
    state { "MyString" }
  end
end
