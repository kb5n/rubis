FactoryBot.define do
  factory :site do
    title Faker::RockBand.name
    description Faker::Lorem.sentence
  end
end
