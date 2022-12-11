FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    year  { Faker::Number.number(digits: 4) }
    rating { Faker::Number.number(digits: 1) }
    plot { Faker::Movie.quote }
  end
end