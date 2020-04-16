FactoryBot.define do
  factory :survey do
    title
    public { false }
    tag {}
    author
  end
end
