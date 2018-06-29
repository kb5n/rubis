FactoryBot.define do
  factory :site do
    title Faker::RockBand.name
    description Faker::Lorem.sentence
    copyright Faker::Company.name
    started_at 1.year.ago
  end
end
