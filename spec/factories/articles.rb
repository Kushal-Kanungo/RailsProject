FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    body { Faker::Book.genre[10..20] }
  end
end
