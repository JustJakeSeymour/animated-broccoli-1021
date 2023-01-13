FactoryBot.define do
  factory :patient do
    name { Faker::FunnyName.name }
    age { Faker::Number.number(digits: 2) }
  end
end
