FactoryBot.define do
  factory :doctor do
    hospital { nil }
    name { Faker::FunnyName.name }
    specialty { Faker::Emotion.noun }
    university { Faker::University.name }
  end
end