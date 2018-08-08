FactoryBot.define do
  factory :user do
    name Faker::Name.name
    sequence(:identifier) { |n| 'user' + n.to_s }
    sequence(:email) { |n| 'user' + n.to_s + '@example.com' }
    password 'test'
    password_confirmation 'test'
    blog_title Faker::RockBand.name
    blog_description Faker::Lorem.sentence
    blog_started_at 1.year.ago
    role_type :admin
  end
end
