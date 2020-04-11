FactoryBot.define do
  factory :survey do
    title
    public { false }
    tag { nil }
    author
    state { "MyString" }
  end
end
