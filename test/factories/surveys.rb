FactoryBot.define do
  factory :survey do
    user
    title
    public { false }
  end
end
