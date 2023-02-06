FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    body { Faker::Alphanumeric.alpha(number: 11) }
  end
end
