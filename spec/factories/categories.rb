FactoryBot.define do
  factory :category do
    association :user
    sequence(:name) { |n| 'CATEGORY' + n.to_s }
    sequence(:identifier) { |n| 'category_' + n.to_s }
    description Faker::Lorem.sentence
  end
end
