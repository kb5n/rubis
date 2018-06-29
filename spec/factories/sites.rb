FactoryBot.define do
  factory :site do
    title Faker::RockBand.name
    description Faker::Lorem.sentence
    started_at 1.year.ago
  end
end
